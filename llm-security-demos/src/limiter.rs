//! Fixed-window rate limiter with an injectable clock (seconds).

/// Admits at most `limit` requests per `window` seconds.
#[derive(Debug)]
pub struct Limiter {
    limit: u32,
    window: u64,
    start: u64,
    count: u32,
}

impl Limiter {
    pub fn new(limit: u32, window: u64) -> Self {
        Self {
            limit,
            window,
            start: 0,
            count: 0,
        }
    }

    /// Returns true when the request at time `now` is admitted.
    pub fn admit(&mut self, now: u64) -> bool {
        if self.count == 0 || now.saturating_sub(self.start) >= self.window {
            self.start = now;
            self.count = 0;
        }
        if self.count < self.limit {
            self.count += 1;
            true
        } else {
            false
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn five_per_window_then_refused() {
        let mut l = Limiter::new(5, 60);
        let admitted = (0..10).filter(|_| l.admit(1)).count();
        assert_eq!(admitted, 5);
    }

    #[test]
    fn new_window_resets() {
        let mut l = Limiter::new(2, 10);
        assert!(l.admit(0) && l.admit(1) && !l.admit(2));
        assert!(l.admit(10));
        assert!(l.admit(11));
        assert!(!l.admit(12));
    }

    #[test]
    fn zero_limit_refuses_all() {
        let mut l = Limiter::new(0, 5);
        assert!(!l.admit(0));
    }
}

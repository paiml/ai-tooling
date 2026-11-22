//! Demo code for the llm-security course (lessons 2.10, 2.11, 2.13).
//!
//! Provable contract: the limiter admits exactly `limit` requests per window
//! and refuses the rest; the guard rejects every cell that starts with a
//! formula trigger character.
pub mod csvguard;
pub mod limiter;
pub mod replyguard;
pub mod serve;

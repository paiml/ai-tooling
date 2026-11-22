fn main() {
    let args: Vec<String> = std::env::args().skip(1).collect();
    std::process::exit(llm_security_demos::csvguard::run(&args));
}

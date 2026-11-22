fn main() {
    let args: Vec<String> = std::env::args().collect();
    std::process::exit(llm_security_demos::replyguard::run(
        &args,
        &mut std::io::stdin(),
    ));
}

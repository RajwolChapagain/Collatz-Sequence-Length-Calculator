fn main() {
    println!("{}", calculate_sequence_length(989345275647));
}

fn calculate_sequence_length(mut n: u128) -> u128 {
    let mut counter: u128 = 0;
    while n != 1 {
        n = if n % 2 == 0 {n / 2} else {n * 3 + 1};
        counter += 1;
    }

    return counter
}

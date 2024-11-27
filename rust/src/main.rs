fn main() {
    let seq_list: Vec<Vec<u128>> = Vec::new();
    let ind = get_min_index(&seq_list);

    println!("{}", calculate_sequence_length(989345275647));
    println!("{}", ind);
}

fn calculate_sequence_length(mut n: u128) -> u128 {
    let mut counter: u128 = 0;
    while n != 1 {
        n = if n % 2 == 0 {n / 2} else {n * 3 + 1};
        counter += 1;
    }

    return counter
}

fn get_min_index(seq_list: &Vec<Vec<u128>>) -> usize {
    let mut min_ind: usize = 0;

    for (i, pair) in seq_list.iter().enumerate() {
        let min_pair = &seq_list[min_ind];

        if pair[1] < min_pair[1] {
            min_ind = i;
        }
        else if pair[1] == min_pair[1] {
            if pair[0] > min_pair[0] {
                min_ind = i;
            }
        }
    }

    return min_ind
}

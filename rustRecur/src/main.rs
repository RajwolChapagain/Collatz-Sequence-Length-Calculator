use num_format::{Locale, ToFormattedString};

fn main() {
    let mut seq_list: Vec<Vec<u128>> = Vec::new();

    let args: Vec<String> = std::env::args().collect();
    let start: u128 = args[1].parse().expect("Not a valid number!"); 
    let end: u128 = args[2].parse().expect("Not a valid number!"); 

    for i in start..=end {
        if i % 100000 == 0 {
            println!("At {}", i.to_formatted_string(&Locale::en));
        }

        let seq_len = calculate_sequence_length(i);
        compare_and_add(i, seq_len, &mut seq_list);
    }

    print_by_seq_len(&seq_list);
    print_by_n(&seq_list);
}

fn calculate_sequence_length(n: u128) -> u128 {
    if n == 1 {
        return 0
    }

    return 1 + calculate_sequence_length(if n % 2 == 0 {n / 2} else {n * 3 + 1})
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

fn compare_and_add(n: u128, seq_len:u128, seq_list: &mut Vec<Vec<u128>>) {
    for pair in &mut *seq_list {
        if seq_len == pair[1] {
            return
        }
    }

    if seq_list.len() < 10 {
        seq_list.push(vec![n, seq_len]);
        return;
    }

    let min_ind = get_min_index(&seq_list);
    let min_pair = &seq_list[min_ind];

    if seq_len > min_pair[1] {
        seq_list[min_ind] = vec![n, seq_len];
    }
}

fn print_by_seq_len(seq_list: &Vec<Vec<u128>>) {
    println!("Sorted based on sequence length");
    let mut sorted_vec = seq_list.clone();
    sorted_vec.sort_by(|a, b| b[1].cmp(&a[1]));

    for item in sorted_vec {
        println!("{:>20} {:>20}", item[0], item[1]);
    }
}

fn print_by_n(seq_list: &Vec<Vec<u128>>) {
    println!("Sorted based on integer size");
    let mut sorted_vec = seq_list.clone();
    sorted_vec.sort_by(|a, b| b[0].cmp(&a[0]));

    for item in sorted_vec {
        println!("{:>20} {:>20}", item[0], item[1]);
    }
}

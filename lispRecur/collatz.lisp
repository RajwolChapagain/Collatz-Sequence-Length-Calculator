(defun calculate_sequence_length (n) 
  (if (= n 1)
    (return-from calculate_sequence_length 0))

  (if (= (mod n 2) 0)
    (return-from calculate_sequence_length (+ 1 (calculate_sequence_length (/ n 2))))
    (return-from calculate_sequence_length (+ 1 (calculate_sequence_length (+ 1 (* n 3)))))))

(defun get_min_index(seq_list)
  (let ((min_ind 0))
    (dotimes (i (length seq_list))
      (let ((min_pair (nth min_ind seq_list)))
        (if (< (second (nth i seq_list)) (second min_pair))
          (setf min_ind i))
        (if (= (second (nth i seq_list)) (second min_pair))
          (if (> (first (nth i seq_list)) (first min_pair))
            (setf min_ind i)))))
    min_ind))

(defun compare_and_add(n seq_len seq_list)
  (dolist (pair seq_list)
    (if (= seq_len (second pair))
      (return-from compare_and_add seq_list)))
   
  (if (< (length seq_list) 10)
    (return-from compare_and_add (append seq_list (list (list n seq_len)))))

  (let* ((min_ind (get_min_index seq_list))
         (min_pair (nth min_ind seq_list)))

    (if (> seq_len (second min_pair))
      (setf (nth min_ind seq_list) (list n seq_len))))

  (return-from compare_and_add seq_list))

(defun print_by_seq_len(seq_list)
  (format t "Sorted based on sequence length~%")
  (let ((sorted_list (sort (copy-list seq_list) #'> :key #'second)))
    (dolist (item sorted_list)
      (format t "~20@a ~20@a~%" (first item) (second item)))))

(defun print_by_n(seq_list)
  (format t "Sorted based on integer size~%")
  (let ((sorted_list (sort (copy-list seq_list) #'> :key #'first)))
    (dolist (item sorted_list)
      (format t "~20@a ~20@a~%" (first item) (second item)))))

(defun main()
  (let ((seq_list (list)))
    (loop for i from (parse-integer (second sb-ext:*posix-argv*)) to (+ (parse-integer (third sb-ext:*posix-argv*)) 1 ) do
          (if (= 0 (mod i 100000))
            (format t "At ~:D~%" i))
          (setf seq_list (compare_and_add i (calculate_sequence_length i) seq_list)))
    (print_by_seq_len seq_list)
    (print_by_n seq_list)))

(main)


(defun calculate_sequence_length (n) 
  (let ((counter 0))
    (loop while (/= n 1)
        do (progn
             (if (= 0 (mod n 2))
                 (setq n (/ n 2))
                 (setq n (+ 1 (* 3 n))))
             (incf counter)))
    counter))

(format t "~a~%" (calculate_sequence_length 989345275647))

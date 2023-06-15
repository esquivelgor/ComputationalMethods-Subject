import logging
import threading
import time

def calculate_square(numbers):
    results = []
    for num in numbers:
        results.append(num * num)
    return results

if __name__ == "__main__":
    format = "%(asctime)s: %(message)s"
    logging.basicConfig(format=format, level=logging.INFO, datefmt="%H:%M:%S")

    numbers = range(1, 10000000)  # List of numbers to calculate squares

    # Single-threaded execution
    start_time = time.time()
    result_single = calculate_square(numbers)
    
    end_time = time.time()
    logging.info("Single-threaded execution took %.2f seconds.", end_time - start_time)

    # Multithreaded execution
    start_time = time.time()
    num_threads = 4  # Number of threads to use
    chunk_size = len(numbers) // num_threads
    threads = []
    results = [[] for _ in range(num_threads)]
    for i in range(num_threads):
        start = i * chunk_size
        end = (i + 1) * chunk_size if i < num_threads - 1 else len(numbers)
        thread = threading.Thread(target=lambda i, s, e: results.__setitem__(i, calculate_square(numbers[s:e])), args=(i, start, end))
        threads.append(thread)
        thread.start()

    for thread in threads:
        thread.join()

    result_multi = [num for sublist in results for num in sublist]
    end_time = time.time()
    logging.info("Multithreaded execution with %d threads took %.2f seconds.", num_threads, end_time - start_time)

    # Verify results
    assert result_single == result_multi
    logging.info("Results verified: Single-threaded and multithreaded results are the same.")

suniq
=====

suniq ("streaming uniq") is a simple Unix command that acts like uniq, but accepts a potentially unending stream of input strings over stdin. Standard usage is to pipe a stream of data (e.g., obtained by tailing a log and fetching a relevant data field per line) to suniq, and suniq will only emit lines to stdout that it hasn't seen already.

The implementation here combines the Pipes library with the StateT monad transformer.


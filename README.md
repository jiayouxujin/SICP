# SICP
## Ref
1. [环境安装教程](https://chee5e.space/sicp-vscode-setup/)

## Notes
### Chapter01
#### Applicative-order vs normal-order
- [Normal Order and Applicative Order](https://berkeley-cs61as.github.io/textbook/normal-order-and-applicative-order.html)

``` lisp
(define (try a b)
  (if (= a 0) 1 b))
```
- (try 0 (/ 1 0))会报错，【mit-scheme默认是applicative-order，all arguments will be evaluated when procedure is applied】
- 如果是normal-order就不会报错，它会使用lazy evaluation,当参数需要的时候才会计算
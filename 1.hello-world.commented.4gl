# Open this file with UTF-8 encoding
# 可能这里服务器的 4GL 编码是 Shift-JIS 的，所以 UTF-8 的编译不成功
# 这个 commented 文件用于看注释，另一个文件可以直接编译执行，试验效果
#
# 注释以 # 开头
# 如果你看到代码全是黑字的话，先看看环境配置配好编辑器
#
# 要编译的话最简单的命令是
# c4gl 1.hello-world.4gl
# 默认它生成的可执行文件名为 a.out，开发的时候就用它就行了
#
# 如果要发布的时候可以指定生成的文件名
# c4gl 1.hello-world.4gl -o 1.hello-world.4ge
main                                    # 主函数，程序的入口函数，相当于 C 的 main 函数
    display "hello world!"              # 向标准输出流输出文本
end main

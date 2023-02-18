blah: blah.o # 默认执行第一条规则
	cc blah.o -o blah

blah.o: blah.c # 目标名，先决条件为blah.c
	cc -c blah.c -o blah.o

blah.c:
	echo "int main() { return 0; }" > blah.c

clean: # 目标名，没有先决条件
	rm -f file1 file2 some_file

files := file1 file2
some_file: $(files)
	echo "variable: " $(files)
	touch some_file

file1:
	touch file1

file2:
	touch file2

a := one two   # 双引号对make没有意义
b := 'one two'
all1:
	printf '$a'
	printf $b

x := dude

all2:
	echo $(x) # 引用变量
	echo ${x} # 同上

	echo $x # 不建议，但是可以使用

all3: one two three # 所有目标运行

one:
	touch one
two:
	touch two
three:
	touch three

clean1:
	rm -f one two three


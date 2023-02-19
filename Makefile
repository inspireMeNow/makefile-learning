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

all4: f1.o f2.o

f1.o f2.o: # 规则中有多个目标时，为每个目标运行命令
	echo $@ # $@是一个包含目标名称的自动变量

print: $(wildcard *.c) # *为通配符，可用于目标、先决条件或wildcard函数中，此规则会列出目录下符合此通配符的文件的详细信息
	ls -ls $?

thing_wrong := *.o # *不能直接用在变量定义中
thing_right := $(wildcard *.o)

# 报错，因为*不能直接用于变量定义
one1: $(thing_wrong)

# 如果没有文件匹配则保持不变
two1: *.o

# 什么也不做
three1: $(thing_right)

# 同上
four1: $(wildcard *.o)

# %最常用于规则定义和特定函数中
# 不能直接在先决列表中使用$@
# 在具有多个目标的模式规则中，$@是导致规则配方运行的名称
# 当目标是存档成员时，$%是目标成员名称
# $<是第一个先决条件的名称
# $?是所有比目标新的先决条件的名称，若目标不存在则包括所有先决条件 

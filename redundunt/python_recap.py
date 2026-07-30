'''write a loop that prints numbers 1–100, skipping multiples of 3 '''
for x in range(1, 101):
    if x % 3 != 0:
        print(x)


'''Functions: default args, return values, docstrings. Write three small utility functions from scratch'''

def hello_func(greeting, name= 'You'):
    return '{}, {}'.format(greeting, name)

print(hello_func('Hello', 'Ronald'))

def student_info(*args, **kwargs):
    print(args)
    print(kwargs)

courses = ['Maths', 'Art']
info = {'name': 'Ron', 'age': 27}

student_info(*courses, **info)


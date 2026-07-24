my_list  = [1, 2, 3]
double = []

# for item in my_list:
    # '''method 1'''
    # new_list = item * 2
    # double.append(new_list)
    # '''method 2'''
#     double.append(item * 2)

# print(double)

# '''method 3'''

# double = [item * 2 for item in my_list]
# print(double)


users = [{'name': 'Ron', 'age': 27}, {'name': 'Jari', 'age': 29}, {'name': 'mum', 'age': 49}]
user_name = [user['name'] for user in users if user['age'] > 30]
print(user_name)
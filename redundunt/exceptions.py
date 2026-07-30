


try:
    num1 = 100
    num2 = 200
    test = num1 / num2

except Exception as error_code:
    print(error_code)
else:
    print(test)
finally:
    print('This worked succesfully')
import random
input1_int = int(input('Specify the lower page number: '))
input2_int = int(input('Specify the higher page number: '))
pages = int(input('How many pages? '))
my_list = []
while len(my_list) <= pages:
    num_rand = random.randint(input1_int, input2_int)
    if num_rand not in my_list:
        my_list.append(num_rand)
    
print(sorted(my_list))
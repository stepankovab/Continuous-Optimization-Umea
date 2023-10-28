counter = 1
circle_count = 12
num = 3
radius_i_str = str(circle_count * 2 + 1)
nlc = "nlc = @(x) deal(["

print("f = @(x) 1 - (" + str(circle_count) + " * x(" + radius_i_str + ")^2 * pi);")
print()

# for i in range(1, circle_count + 1):
#     for j in range(i + 1, circle_count + 1):
#         print("g" + str(counter) + " = @(x) (2 * x(" + radius_i_str + "))^2 - (x(" + str(i) + ") - x(" + str(j) + "))^2 - (x(" + str(circle_count + i) + ") - x(" + str(circle_count + j) + "))^2")
#         nlc = nlc + "g" + str(counter) + "(x),"
#         counter += 1

# for i in range(1, 2 * circle_count + 1):
#     print("g" + str(counter) + " = @(x) x(" + radius_i_str + ") - x(" + str(i) + ");")
#     nlc = nlc + "g" + str(counter) + "(x),"
#     counter += 1
#     print("g" + str(counter) + " = @(x) x(" + radius_i_str + ") + x(" + str(i) + ") - 1;")
#     nlc = nlc + "g" + str(counter) + "(x),"
#     counter += 1
# print()

# nlc = nlc[:-1]
# nlc += "], []);"
# print(nlc)


xstart = []
ystart = []

for i in range(num):
    for j in range(circle_count // num):
        xstart.append(str((i + 1) / (num + 1)))
        ystart.append(str((j + 1) / (circle_count // num + 1)))




print("start = [" + ",".join(xstart) + "," + ",".join(ystart) + "," + str(1/(circle_count)) + "];")
print("lb = zeros(1," + radius_i_str + ");")
print("ub = [" + ",".join(["1" for x in range(circle_count * 2)]) + ",0.5];")
print()
print("xopt = fmincon(f, start, [], [], [], [], lb, ub, nlc)")
print()
print("radius = xopt(" + radius_i_str + ");")
print("xcoords = [" + ",".join(["xopt("+ str(x) +")" for x in range(1, circle_count + 1)]) + "];")
print("ycoords = [" + ",".join(["xopt("+ str(circle_count + x) +")" for x in range(1, circle_count + 1)]) + "];")

print()

print(str(circle_count) + " * radius^2 * pi")
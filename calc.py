# class Solution(object):
#   def __eval_helper(self, expression, index):
#     op = '+'
#     result = 0
#     while index < len(expression):
#       char = expression[index]
#       if char in ('+', '-'):
#         op = char
#       else:
#         value = 0
#         if char.isdigit():
#           value = int(char)
#         elif char == '(':
#           (value, index) = self.__eval_helper(expression, index + 1)
#         if op == '+':
#           result += value
#         if op == '-':
#           result -= value
#       index += 1
#     return (result, index)

#   def eval(self, expression):
#     return self.__eval_helper(expression, 0)[0]


class Solution(object):
    def __eval_helper(self, expr, index, sign, operand):
        result = 0

        while index < len(expr):
            operand = operand
            sign = sign
            ch = expr[index]

            if ch.isdigit():
                operand = (operand * 10) + int(ch)
            elif ch == '(':
                (value, index) = self.__eval_helper(expr, index + 1, sign, operand)
            if ch == '+':
                result = sign * operand

                sign = 1
                operand = 0
            elif ch == '-':
                result = sign * operand

                sign = -1
                operand = 0

            index += 1
        return (result, index)

    def eval(self, expr):
        return self.__eval_helper(expr, 0, 1, 0)[0]


print(Solution().eval('(1 + (2 + (3 + (4 + 5))))'))
# print(Solution().eval('123456'))

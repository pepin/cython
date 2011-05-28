# cython: warn.maybe_uninitialized=True
# mode: error
# tag: werror

def simple():
    print a
    a = 0

def simple2(arg):
    if arg > 0:
        a = 1
    return a

def simple_pos(arg):
    if arg > 0:
        a = 1
    else:
        a = 0
    return a

def ifelif(c1, c2):
    if c1 == 1:
        if c2:
            a = 1
        else:
            a = 2
    elif c1 == 2:
        a = 3
    return a

def nowimpossible(a):
    if a:
        b = 1
    if a:
        print b

def fromclosure():
    def bar():
        print a
    a = 1
    return bar

# Should work ok in both py2 and py3
def list_comp(a):
    return [i for i in a]

def set_comp(a):
    return set(i for i in a)

def dict_comp(a):
    return {i: j for i, j in a}

# args and kwargs
def generic_args_call(*args, **kwargs):
    return args, kwargs

def cascaded(x):
    print a, b
    a = b = x

def from_import():
    print bar
    from foo import bar

_ERRORS = """
6:11: local variable 'a' referenced before assignment
12:12: local variable 'a' might be referenced before assignment
29:12: local variable 'a' might be referenced before assignment
35:15: local variable 'b' might be referenced before assignment
58:11: local variable 'a' referenced before assignment
58:14: local variable 'b' referenced before assignment
62:13: local variable 'bar' referenced before assignment
"""
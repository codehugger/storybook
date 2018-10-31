class Domain(object):
  name = ""

  """docstring for Domain"""
  def __init__(self, arg):
    super(Domain, self).__init__()
    self.arg = arg


class Type(object):
  __name = ""
  __type = ""

  """docstring for Type"""
  def __init__(self, name, typ):
    super(Type, self).__init__()
    self.__name = name
    self.__type = typ


class Constant(object):
  __name = ""
  __type = None

  """docstring for Constant"""
  def __init__(self, name, typ):
    super(Constant, self).__init__()
    self.__name = name
    self.__type = typ


class Predicate(object):
  __name = ""
  __variables = []

  """docstring for Predicate"""
  def __init__(self, name, variables):
    super(Predicate, self).__init__()
    self.__name = name
    self.__variables = variables


class Variable(object):
  __name = ""
  __type = []

  """docstring for Variable"""
  def __init__(self, name, typ):
    super(Variable, self).__init__()
    self.__name = name
    self.__type = typ


class Effect(object):
  __name = ""
  __effect = None
  __variables = []

  """docstring for Effect"""
  def __init__(self, name, effect, variables):
    super(Effect, self).__init__()
    self.__name = name
    self.__effect = effect
    self.__variables = variables


class Action(object):
  __name = ""
  __preconditions = []
  __effects = []
  __agents = []

  """docstring for Action"""
  def __init__(self, name, preconditions, effects, agents):
    super(Action, self).__init__()
    self.__name = name
    self.__preconditions = preconditions
    self.__effects = effects
    self.__agents = agents

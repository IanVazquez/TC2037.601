import re

def read_file(file_path):
    categories = {
        'String': [],
        'Integer': [],
        'Boolean': [],
        'Identifier': [],
        'Function': []
    }

    with open(file_path, 'r') as file:
        for line in file:
            words = re.findall(r'\b\w+\b', line)

            for word in words:
                if is_literal(word):
                    category = determine_literal_category(word)
                elif is_function(word):
                    category = 'Function'
                else:
                    category = determine_identifier_category(word)

                if category:
                    categories[category].append(word)

    return categories

def is_literal(word):
    try:
        eval(word)
        return True
    except (SyntaxError, NameError, ValueError):
        return False

def determine_literal_category(literal):
    if isinstance(eval(literal), str):
        return 'String'
    elif isinstance(eval(literal), int):
        return 'Integer'
    elif isinstance(eval(literal), bool):
        return 'Boolean'
    else:
        return None

def is_function(word):
    pattern = r'^[a-zA-Z_][a-zA-Z0-9_]*\(\)$'
    return re.match(pattern, word) is not None

def determine_identifier_category(identifier):
    pattern = r'^[a-zA-Z_][a-zA-Z0-9_]*$'
    if re.match(pattern, identifier):
        return 'Identifier'
    else:
        return None
def get_category_counts(categories):
    counts = {}
    for category in categories:
        counts[category] = len(categories[category])
    return counts

def split_string_and_get_value_from_index(text_: str, sep_: str, index_: int) -> str:
    """
    Split text_ by separator (sep_) and return the part by index_.
    Example: 
        text_ = filename_1234, sep_ = _, index_ = 1
        output: 1234
    Use this when you want to extract a part of a text asking for an index.
    """
    parts = text_.split(sep_)
    if not isinstance(index_, int):
        raise AssertionError(f"{(type(index_) is int)=}")
    elif not (0 <= index_):
        raise AssertionError(f"{(0 <= index_)=}")
    elif not (index_ < len(parts)):
        raise AssertionError(f"{(index_ < len(parts))=}")
    return parts[index_]
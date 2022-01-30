#!/usr/bin/env python3

import fnmatch
import os
import sys

fuzzysearch = True
try:
    from fuzzywuzzy import process  # type: ignore
except:
    fuzzysearch = False


def list_passwords(*, pass_dir: str) -> list[str]:
    ret = []
    for root, dirnames, filenames in os.walk(pass_dir, True, None, True):
        for filename in fnmatch.filter(filenames, "*.gpg"):
            ret.append(
                os.path.join(root, filename.replace(".gpg", "")).replace(pass_dir, "")
            )
    return sorted(ret, key=lambda s: s.lower())


def search_passwords(*, query: str, passwords: list[str]) -> list[str]:
    """Search passwords using the Fuzzy search method if fuzzywuzzy is available,
    or default to the filter-based search otherwise"""
    if fuzzysearch:
        return search_passwords_fuzzy(query=query, passwords=passwords)
    return search_passwords_filter(query=query, passwords=passwords)


def search_passwords_fuzzy(*, query: str, passwords: list[str]) -> list[str]:
    """Search passwords using the Fuzzy search method using fuzzywuzzy"""
    return [entry[0] for entry in process.extract(query, passwords)]


def search_passwords_filter(*, query: str, passwords: list[str]) -> list[str]:
    """Search passwords using the filter-based search, which doesn't require fuzzywuzzy"""
    ret = []

    terms = [term for term in query.lower().split() if term]

    for password in passwords:
        for t in terms:
            if t not in password.lower():
                break
        else:
            ret.append(password)

    return ret


def xmlize(*, password: str, query: str) -> str:
    xml_item: str = ""

    list = password.rsplit("/", 1)
    name = list[-1]
    path = password if len(list) == 2 else ""

    complete = password
    if password.lower().startswith(query.lower()):
        i = password.find("/", len(query))
        if i != -1:
            complete = password[: (i + 1)]

    return f"""
        <item uid="{password}" arg="{password}" autocomplete="{complete}">
            <title>{name}</title>
            <subtitle>{path}</subtitle>
        </item>
    """


def main() -> None:
    query = sys.argv[1]

    home = os.environ["HOME"]
    pass_dir = os.environ.get(
        "PASSWORD_STORE_DIR",
        os.path.join(home, ".password-store/"),
    )

    passwords = list_passwords(pass_dir=pass_dir)

    passwords = search_passwords(query=query, passwords=passwords)

    print('<?xml version="1.0"?>')
    print("<items>")
    for password in passwords:
        print(
            xmlize(
                password=password,
                query=query,
            )
        )
    print("</items>")


if __name__ == "__main__":
    main()

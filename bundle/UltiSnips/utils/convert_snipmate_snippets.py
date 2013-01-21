#!/usr/bin/env python
# encoding: utf-8
"""
Convert snipmate compatible snippets to UltiSnips compatible snippets
by Phillip Berndt
"""
import sys
import re
import os
import argparse

sys.path.append(os.paith.join(os.path.dirname(__file__), "py-code")
import UltiSnips.snipmate

def convert_snippet_file(source):
    [result, errs] = UltiSnips.snipmate.convert_snippet_lines(source, open(source).readlines())
    for e in errs:
        print >> sys.stderr, e
    return result

def convert_snippet(source):
    " One file per snippet "
    name = os.path.basename(source)[:-8]
    return 'snippet %s "%s"' % (name, name) + "\n" + \
        UltiSnips.snipmate.convert_snippet_contents(open(source).read()) + \
        "\nendsnippet\n"

def convert_snippets(source):
    if os.path.isdir(source):
        return "\n".join((convert_snippet(os.path.join(source, x)) for x in os.listdir(source) if x[-8:] == ".snippet"))
    else:
        return convert_snippet_file(source)

if __name__ == '__main__':
    # Parse command line
    argsp = argparse.ArgumentParser(description="Convert snipmate compatible snippets to UltiSnips' file format",
        epilog="example:\n  %s drupal/ drupal.snippets\n   will convert all drupal specific snippets from snipmate into one file drupal.snippets" % sys.argv[0],
        formatter_class=argparse.RawDescriptionHelpFormatter)
    argsp.add_argument("source", help="Source directory for one filetype or a snippets file")
    argsp.add_argument("target", help="File to write the resulting snippets into. If omitted, the snippets will be written to stdout.", nargs="?", default="-")
    args = argsp.parse_args()

    source_file_name = args.source
    tmp_file_name = ''.join([args.target,'.tmp'])
    try:
        tmp = sys.stdout if args.target == "-" else open(tmp_file_name, "w")
    except IOError:
        print >> sys.stderr, "Error: Failed to open output file %s for writing" % tmp_file_name
        sys.exit(1)

    snippets = convert_snippets(source_file_name)
    print >> tmp, snippets

    if args.target != "-":
        if os.access(args.target, os.F_OK):
            os.remove(args.target)
        os.rename(tmp_file_name, args.target)

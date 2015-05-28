#!/usr/bin/python3

import os
import re
import subprocess
import language_check
import time


tool = language_check.LanguageTool('en-UK')
includedFiles = r'.+\.tex$'
content = []

badPatterns = [(r'\s()\\(ref|cite)', 'Space not \'~\' before ref/cite', []),
				(r'\$.*[^r]\*().*\$', 'Star Operator', []),
				(r'(s()ection|a()lgorithm|f()igure)( |~)\\ref', 'Lower case section/algorithm/figure', []),
				(r'[^/](cache M()iss|[cC]ache-()[mM]iss|\b\sC()ache miss)', 'Cache miss spelling', []),
				(r'[mM]iss?-()[pP]rediction', 'Misprediction error', []),
				(r'{figure}()\[', 'Bad Figure Placement', []),
				(r'\$.*[^\\]()log\b.*\$', 'Non-roman log in mathmode', []),
				(r'\\()mod[^{]', 'Wrong usage of \\mod', []),
				(r'((?!(Figure|Section|Table|Appendix).*)\ref)', 'Unnamed Reference', []),
				(r'\b([Qq]uite|[Vv]ery [^h]|[Nn]ice|[Ll]ikely)()', 'Non-sciency word', []),
				(r'SSE4\.2()', 'Wrong SSE version', []),
				(r'for ()loop', 'Missing for loop hyphen', []),
				(r'()\\todo', 'Unfixed todo', ['thesis.tex']),
				(r'()compare-[eE]xchange', 'Unbigged Compare-Exchange', ['SIMD.tex']),
				(r'()>=|<=', 'Un-mathed comparison', ['SIMD.tex']),
				(r'this ()paper', 'Paper mentioned', []),
				(r'\\Require()', 'Require obsolete', []),
				(r'ceil\{1\.7()', '1.7 misuse',[]),
				(r'Simd|simd()', 'SIMD',['thesis.tex']),
				(r'==()', 'double-equality instead of $\gets $',[]),
				(r"it's()", "it's vs. its",[]),
				(r'-th|\^{th}\$', 'use $i$th instead of i-th or $i^{th}$',[]),
				(r'bwt', 'use BWT instead of bwt or \textit{bwt}',[]),
				(r"n't", "use do not/will not/does not instead of don't/won't/doesn't", []),
				(r"let's", 'use "let us" instead of "let\'s"', []),
				(r"'re", "use 'we are' or 'they are' instead of we're or they're", []),
				(r"'ve", "use 'we have' or 'they have' instead of we've or they've", []),
				(r'(?<!igure|ction|ition|rithm|Table)~\\ref{', '~\\ref{} should follow either Figure, Section, Definition, Algorithm or Table', []),
				(r'(?<!-)order entropy', 'use kth-order entropy instead of kth order entropy', []),
				(r'\\texttt{popcountl}', 'use popcount instead of popcountl when discussing the use of it.', []),
				(r'(?!\.\w+)(Wall Time|Cache Miss(es)?|Branch Miss(es)?|Translation Lookaside Buffer|Wavelet Tree)', 'Consistently use lower-case unless first word of sentence or first time introduction or header etc.', []),
				]
sublime = r'subl'

excludedRules = [
	'MORFOLOGIK_RULE_EN_UK',
	'WHITESPACE_RULE',
	'CURRENCY',
	'COMMA_PARENTHESIS_WHITESPACE',
	'EN_UNPAIRED_BRACKETS',
	'ENGLISH_WORD_REPEAT_BEGINNING_RULE',
	'HE_VERB_AGR'
]


def langCheck(lines, fname, rname):
	for match in tool.check(''.join(lines)):
		if match.ruleId not in excludedRules:
			print(fname)
			print(match)

def check(lines, patterns, fname, rname):
	counter = 0
	for pattern, mes, exclude in badPatterns:
		if fname in exclude:
			continue
		for c, line in enumerate(lines):
			match =  re.search(pattern, line)
			if match:
				# subprocess.call([sublime, '{}:{}:{}'.format(rname, c+1, match.start(1) + 1)])
				print(fname, '::', c+1, ' # ', mes)
				print(line)
				counter += 1
	return counter

counter = 0

for filename in os.listdir('Report'):
	if re.match(includedFiles, filename):
		filepath = 'Report/'+filename
		with open(filepath) as f:
			content = f.readlines()
			counter += check(content, badPatterns, filename, filepath)
			langCheck(content, filename, filepath)
print(counter, 'total errors')
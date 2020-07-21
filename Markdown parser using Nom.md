#rust #nom #parser

Source: https://github.com/HGHimself/prose/blob/master/src/markdown.rs

This is a source code of a Markdown [[Parser]] written in Rust and uses [[Nom Parser]]. It's very clear and easy to read. And it's a very good place to start when you want to get the idea of [[Parser Combination]].

Apparently I was looking for something that could convert a string into some other data structure, but it doesn't matter.

Here's how it work:

1. First, write some primitive parser, for things like bold, italic, links — these are called inline markdown

```
fn parse_bold_text(input: &str) -> Result<&str, &str> {
	delimited(tag("**"), is_not("**"), tag("**"))(i)
}

fn parse_link(input: &str) -> Result<&str, (&str, &str)> {
	pair(
		delimited(tag("["), is_not("]"), tag("]")),
		delimited(tag("("), is_not(")"), tag(")")),
	)(i)
}
```

2. Then, combine them all into a larger block, we can map the result into another data structure. For example, the following map the parsed result into a MarkdownInline struct.

```
fn parse_inline_markdown(i: &str) -> Result<&str, MarkdownInline> {
	alt((
		map(parse_bold_text, |s: &str| MarkdownInline::Bold(s)),
		map(parse_link, |(text, url): (&str, &str)| MarkdownInline::Link(text, url)),	
	))(i)
}
```

The key thing when working with parser combination, is to form the combination (or relation) between the primitives.

For example, a Header should be a combination of # tags and markdown text elements. A paragraph should be a combination of many inline and markdown text.

#let noindent(body) = {
	set par(first-line-indent: 0em)
	body
}

#let opening(
	title: "",
	faculty: "",
	profession: "",
 	author: "",
 	studentnumber: "",
 	adviser: "",
	purpose: none,
	status: none,
	method: none,
	result: none,
	plan: none,
	bibliography: none,
	audit: none,
	body: none,
) = {
	set document(title: title, author: author)
	set enum(numbering: "1.a,i.")
	set par(first-line-indent: 2em, justify: true)
	show par: set block(spacing: 0.65em)
	set text(font: ("Times New Roman", "SimSun"), lang: "zh")

	//************ 标题页设置
	v(5fr)
	// align(center, image("logo.png", width: 50%))
	v(10pt)
	set align(center)
	text(3em, "吉利学院")
	v(10pt)
	text(3em, "毕业论文（设计）开题报告")

	v(10fr, weak: true)
	let hline() = [#v(-0.7em)#line(length: 20em)]
	table(
		columns: (20%, auto),
		stroke: none,
		[题#h(2em)目：],
		[#title#hline()],
		[学#h(2em)院：],
		[#faculty#hline()],
		[专#h(2em)业：],
		[#profession#hline()],
		[学生姓名：],
		[#author#hline()],
		[学#h(2em)号：],
		[#studentnumber#hline()],
		[指导教师：],
		[#adviser#hline()]
	)

	v(10fr, weak: true)
	set align(left)
	pagebreak()
	//************

	
	let h1em = [#h(1em)#v(-0.7em)#line(length: 1em)]
	let h2em = [#h(2em)#v(-0.7em)#line(length: 2em)]
	let signature = {
		grid(
			columns: (2fr, 1fr, 2fr, 1fr, 2fr),
			[指导教师（签字）：],
			[],
			[教研室负责人（签字）：],
			[],
			[#align(end)[#h(2em)年#h(1em)月#h(1em)日]]
		)
	}
	
	table(
		columns: (1fr,),
	  [*一、选题依据和意义*#linebreak()#purpose],
	  [*二、国内外研究状况*#linebreak()#status],
	  [*三、研究内容及思路方法*#linebreak()#method],
	  [*四、预期结果*#linebreak()#result],
	  [*五、进度计划*#linebreak()#plan],
	  [*六、参考文献*#linebreak()#bibliography],
	  [审阅意见：#linebreak()#audit#signature]
	)
	body
}

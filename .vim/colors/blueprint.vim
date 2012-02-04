" Vim color file - blueprint
" Generated by http://bytefluent.com/vivify 2012-02-04
set background=dark

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name = "blueprint"

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
	finish
endif

" functions {{{
" returns an approximate grey index for the given grey level
fun <SID>grey_number(x)
	if &t_Co == 88
		if a:x < 23
			return 0
		elseif a:x < 69
			return 1
		elseif a:x < 103
			return 2
		elseif a:x < 127
			return 3
		elseif a:x < 150
			return 4
		elseif a:x < 173
			return 5
		elseif a:x < 196
			return 6
		elseif a:x < 219
			return 7
		elseif a:x < 243
			return 8
		else
			return 9
		endif
	else
		if a:x < 14
			return 0
		else
			let l:n = (a:x - 8) / 10
			let l:m = (a:x - 8) % 10
			if l:m < 5
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual grey level represented by the grey index
fun <SID>grey_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 46
		elseif a:n == 2
			return 92
		elseif a:n == 3
			return 115
		elseif a:n == 4
			return 139
		elseif a:n == 5
			return 162
		elseif a:n == 6
			return 185
		elseif a:n == 7
			return 208
		elseif a:n == 8
			return 231
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 8 + (a:n * 10)
		endif
	endif
endfun

" returns the palette index for the given grey index
fun <SID>grey_color(n)
	if &t_Co == 88
		if a:n == 0
			return 16
		elseif a:n == 9
			return 79
		else
			return 79 + a:n
		endif
	else
		if a:n == 0
			return 16
		elseif a:n == 25
			return 231
		else
			return 231 + a:n
		endif
	endif
endfun

" returns an approximate color index for the given color level
fun <SID>rgb_number(x)
	if &t_Co == 88
		if a:x < 69
			return 0
		elseif a:x < 172
			return 1
		elseif a:x < 230
			return 2
		else
			return 3
		endif
	else
		if a:x < 75
			return 0
		else
			let l:n = (a:x - 55) / 40
			let l:m = (a:x - 55) % 40
			if l:m < 20
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual color level for the given color index
fun <SID>rgb_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 139
		elseif a:n == 2
			return 205
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 55 + (a:n * 40)
		endif
	endif
endfun

" returns the palette index for the given R/G/B color indices
fun <SID>rgb_color(x, y, z)
	if &t_Co == 88
		return 16 + (a:x * 16) + (a:y * 4) + a:z
	else
		return 16 + (a:x * 36) + (a:y * 6) + a:z
	endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun <SID>color(r, g, b)
	" get the closest grey
	let l:gx = <SID>grey_number(a:r)
	let l:gy = <SID>grey_number(a:g)
	let l:gz = <SID>grey_number(a:b)

	" get the closest color
	let l:x = <SID>rgb_number(a:r)
	let l:y = <SID>rgb_number(a:g)
	let l:z = <SID>rgb_number(a:b)

	if l:gx == l:gy && l:gy == l:gz
		" there are two possibilities
		let l:dgr = <SID>grey_level(l:gx) - a:r
		let l:dgg = <SID>grey_level(l:gy) - a:g
		let l:dgb = <SID>grey_level(l:gz) - a:b
		let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
		let l:dr = <SID>rgb_level(l:gx) - a:r
		let l:dg = <SID>rgb_level(l:gy) - a:g
		let l:db = <SID>rgb_level(l:gz) - a:b
		let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
		if l:dgrey < l:drgb
			" use the grey
			return <SID>grey_color(l:gx)
		else
			" use the color
			return <SID>rgb_color(l:x, l:y, l:z)
		endif
	else
		" only one possibility
		return <SID>rgb_color(l:x, l:y, l:z)
	endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun <SID>rgb(rgb)
	let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
	let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
	let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
	return <SID>color(l:r, l:g, l:b)
endfun

" sets the highlighting for the given group
fun <SID>X(group, fg, bg, attr)
	if a:fg != ""
		exec "hi ".a:group." guifg=#".a:fg." ctermfg=".<SID>rgb(a:fg)
	endif
	if a:bg != ""
		exec "hi ".a:group." guibg=#".a:bg." guisp=#".a:bg." ctermbg=".<SID>rgb(a:bg)
	endif
	if a:attr != ""
		if a:attr == 'italic'
			exec "hi ".a:group." gui=".a:attr." cterm=none"
		else
			exec "hi ".a:group." gui=".a:attr." cterm=".a:attr
		endif
	endif
endfun
" }}}
call <SID>X("Boolean","ffffff","","bold")
call <SID>X("CTagsClass","e2e4e5","","none")
call <SID>X("CTagsGlobalConstant","e2e4e5","","none")
call <SID>X("CTagsGlobalVariable","e2e4e5","","none")
call <SID>X("CTagsImport","e2e4e5","","none")
call <SID>X("CTagsMember","e2e4e5","","none")
call <SID>X("Character","ffa0a0","","none")
call <SID>X("Comment","80a0ff","","none")
call <SID>X("Conditional","60ff60","","none")
call <SID>X("Constant","ffa0a0","","none")
call <SID>X("Cursor","000020","ffaf38","none")
call <SID>X("CursorColumn","e2e4e5","","none")
call <SID>X("CursorLine","e2e4e5","","none")
call <SID>X("Debug","ffa500","","none")
call <SID>X("Define","999999","","none")
call <SID>X("DefinedName","e2e4e5","","none")
call <SID>X("Delimiter","ffa500","","none")
call <SID>X("DiffAdd","cccccc","00008b","none")
call <SID>X("DiffChange","cccccc","8b008b","none")
call <SID>X("DiffDelete","0000ff","008b8b","bold")
call <SID>X("DiffText","ffa0a0","","none")
call <SID>X("Directory","00ffff","","none")
call <SID>X("EnumerationName","e2e4e5","","none")
call <SID>X("EnumerationValue","e2e4e5","","none")
call <SID>X("Error","e2e4e5","","none")
call <SID>X("ErrorMsg","ffffff","0e4072","none")
call <SID>X("Exception","60ff60","","none")
call <SID>X("Float","e2e4e5","","none")
call <SID>X("FoldColumn","808080","0d3d6d","bold")
call <SID>X("Folded","808080","0d3d6d","bold")
call <SID>X("Function","40ffff","","none")
call <SID>X("Identifier","40ffff","","none")
call <SID>X("Ignore","0e4072","","none")
call <SID>X("IncSearch","b0ffff","2050d0","none")
call <SID>X("Include","999999","","none")
call <SID>X("Keyword","60ff60","","none")
call <SID>X("Label","60ff60","","none")
call <SID>X("LineNr","808080","","none")
call <SID>X("LocalVariable","e2e4e5","","none")
call <SID>X("Macro","999999","","none")
call <SID>X("MatchParen","e2e4e5","","none")
call <SID>X("ModeMsg","22cce2","","none")
call <SID>X("MoreMsg","006400","","none")
call <SID>X("NonText","0030ff","","none")
call <SID>X("Normal","cccccc","0e4072","none")
call <SID>X("Number","ffa0a0","","none")
call <SID>X("Operator","60ff60","","none")
call <SID>X("PMenu","000000","a9a9a9","none")
call <SID>X("PMenuSbar","000000","848688","none")
call <SID>X("PMenuSel","0000ff","a9a9a9","none")
call <SID>X("PMenuThumb","000000","808080","none")
call <SID>X("PreCondit","999999","","none")
call <SID>X("PreProc","999999","","none")
call <SID>X("Question","00ff00","","none")
call <SID>X("Repeat","60ff60","","none")
call <SID>X("Search","2050d0","90fff0","underline")
call <SID>X("SignColumn","e2e4e5","","none")
call <SID>X("Special","ffa500","","none")
call <SID>X("SpecialChar","ffa500","","none")
call <SID>X("SpecialComment","ffa500","","none")
call <SID>X("SpecialKey","00ffff","","none")
call <SID>X("SpellBad","e2e4e5","","none")
call <SID>X("SpellCap","e2e4e5","","none")
call <SID>X("SpellLocal","e2e4e5","","none")
call <SID>X("SpellRare","e2e4e5","","none")
call <SID>X("Statement","ffffff","","bold")
call <SID>X("StatusLine","0000ff","a9a9a9","none")
call <SID>X("StatusLineNC","000000","a9a9a9","none")
call <SID>X("StorageClass","60ff60","","none")
call <SID>X("String","ffa0a0","","none")
call <SID>X("Structure","60ff60","","none")
call <SID>X("TabLine","e2e4e5","","none")
call <SID>X("TabLineFill","e2e4e5","","none")
call <SID>X("TabLineSel","e2e4e5","","none")
call <SID>X("Tag","ffa500","","none")
call <SID>X("Title","ff00ff","","bold")
call <SID>X("Todo","d14a14","1248d1","none")
call <SID>X("Type","60ff60","","none")
call <SID>X("Typedef","60ff60","","none")
call <SID>X("Underlined","e2e4e5","","underline")
call <SID>X("Union","e2e4e5","","none")
call <SID>X("VertSplit","000000","a9a9a9","none")
call <SID>X("Visual","606060","cccccc","none")
call <SID>X("VisualNOS","0e4072","cccccc","underline")
call <SID>X("WarningMsg","ff0000","","none")
call <SID>X("WildMenu","ffff00","000000","none")
call <SID>X("pythonBuiltin","cccccc","","none")
call <SID>X("JavaScriptStrings","e2e4e5","","none")
call <SID>X("phpStringSingle","e2e4e5","","none")
call <SID>X("phpStringDouble","e2e4e5","","none")
call <SID>X("htmlString","cccccc","","none")
call <SID>X("htmlTagName","cccccc","","none")
" delete functions {{{
delf <SID>X
delf <SID>rgb
delf <SID>color
delf <SID>rgb_color
delf <SID>rgb_level
delf <SID>rgb_number
delf <SID>grey_color
delf <SID>grey_level
delf <SID>grey_number
" }}}


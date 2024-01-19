local config = function()
	vim.cmd([[
    let g:quicktex_excludechar = ['\$', '{', '(', '[', '-']
    let g:quicktex_math_filetypes = ['tex', 'markdown', 'pandoc', 'org', 'norg']
    ]])

	vim.cmd([[
    " " \'m'   : '\( <+++> \) <++>',
    " \'M'   : '\[ <+++> \] <++>',
    let g:quicktex_tex = {
        \' '   : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
        \'m'   : '\(<+++>\) <++>',
        \'M'   : '\[<+++>\] <++>',
        \'doc'   : "\\documentclass[12pt]{article}\<CR><+++>",
        \'bdoc'  : "\\begin{document}\<CR>\<CR><+++>\<CR>\<CR>\\end{document}",
        \'eq' : "\\begin{equation}\<CR><+++>\<CR>\\end{equation}",
        \'eit'   : "\\begin{itemize}\<CR>\\item <+++>\<CR>\\end{itemize}\<CR>\<CR><++>",
        \'enu'   : "\\begin{enumerate}\<CR>\\item <+++>\<CR>\\end{enumerate}\<CR>\<CR><++>",
        \'eti'   : "\\begin{tikzpicture}\<CR>\\item <+++>\<CR>\\end{tikzpicture}\<CR>\<CR><++>",
        \'efi'   : "\\begin{figure}\<CR><+++>\<CR>\\end{figure}\<CR>\<CR><++>",
        \'tb'   : "\\textbf{<+++>}<++>",
        \'ti'   : "\\textit{<+++>}<++>",
        \'te'   : "\\emph{<+++>}<++>",
        \'t`'   : "\\texttt{<+++>} <++>",
        \'pkg'   : "\\usepackage{<+++>}\<CR><++>",
        \'sec'   : "\\section{<+++>}\<CR>\<CR><++>",
        \'sub'   : "\\subsection{<+++>}\<CR>\<CR><++>",
        \'subsub'   : "\\subsubsection{<+++>}\<CR>\<CR><++>",
        \}

        let g:quicktex_markdown = {
            \'m'   : '$<+++>$ <++>',
            \'eq' : "\\begin{equation}\<CR><+++>\<CR>\\end{equation}",
            \'M'   : '$$<+++>$$ <++>',
            \}

            let g:quicktex_norg = {
                \'m'   : '$<+++>$ <++>',
                \'M'   : '$$<+++>$$ <++>',
                \}

                let g:quicktex_pandoc = {
                    \'m'   : '$<+++>$ <++>',
                    \'M'   : '$$<+++>$$ <++>',
                    \}

                    let g:quicktex_org = {
                        \'m'   : '$<+++>$ <++>',
                        \'M'   : '$$<+++>$$ <++>',
                        \}

                        let g:quicktex_math = {
                            \' '    : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
                            \'eq'   : '= ',
                            \'equ'   : '\equiv ',
                            \'pl'   : '+ ',
                            \'mi'   : '- ',
                            \'pm'   : '\pm ',
                            \'inf'   : '\infty ',
                            \'fr' : '\frac{<+++>}{<++>} <++>',
                            \'neq'   : '\neq ',
                            \'neg'   : '\neg ',
                            \'leq'   : '\leq ',
                            \'geq'   : '\geq ',
                            \'pr'   : '(<+++>) <++>',
                            \'pair'   : '(<+++> , <++>) <++>',
                            \'set'  : '\{ <+++> \} <++>',
                            \'vec'   : '\vec{<+++>} <++>',
                            \'tim'   : '\times ',
                            \'one'  : '1 ',
                            \'st'   : ': ',
                            \'in'   : '\in ',
                            \'notin'   : 'not\in ',
                            \'pi'   : '\pi ',
                            \'Pi'   : '\Pi ',
                            \'del'   : '\Delta ',
                            \'eps'   : '\epsilon ',
                            \'th'   : '\theta ',
                            \'Th'   : '\Theta ',
                            \'alp'   : '\alpha ',
                            \'bet'   : '\beta ',
                            \'gam'   : '\gamma ',
                            \'phi'   : '\phi ',
                            \'psi'   : '\psi ',
                            \'rho'   : '\rho ',
                            \'lam'   : '\lambda ',
                            \'mid'   : '\mid ',
                            \'imp'   : '\implies ',
                            \'pa'   : '\partial ',
                            \'sr'   : '<+++>^2 <++>',
                            \'tp'   : '^{<+++>} <++>',
                            \'sq'   : '\sqrt{<+++>} <++>',
                            \'abs'   : '|<+++>| <++>',
                            \'sin'   : '\sin{<+++>} <++>',
                            \'cos'   : '\cos{<+++>} <++>',
                            \'tan'   : '\tan{<+++>} <++>',
                            \'csc'   : '\csc{<+++>} <++>',
                            \'sec'   : '\sec{<+++>} <++>',
                            \'cot'   : '\cot{<+++>} <++>',
                            \'mbb'   : '\mathbb{<+++>} <++>',
                            \'lim'   : '\lim_{<+++> \to <++>} <++>',
                            \'int'   : '\int_{<+++>}^{<++>} <++>',
                            \'sum'   : '\sum_{<+++>}^{<++>} <++>',
                            \'exp'   : 'e^{<+++>} <++>',
                            \'cup'   : '\cup ',
                            \'cap'   : '\cap ',
                            \'bar'   : '\bar{<+++>} <++>',
                            \'iff'   : '\iff ',
                            \'opl'   : '\oplus ',
                            \'vee'   : '\vee ',
                            \'wed'   : '\wedge ',
                            \'la'   : '\leftarrow ',
                            \'ra'   : '\rightarrow ',
                            \'lra'   : '\leftrightarrow ',
                            \'log'   : '\log{<+++>} <++>',
                            \'fal'   : '\forall ',
                            \'exi'   : '\exists ',
                            \'mu'   : '\mu ',
                            \'sig'   : '\sigma ',
                            \'om'   : '\omega ',
                            \'Om'   : '\Omega ',
                            \'sub'   : '\subseteq ',
                            \'ssub'   : '\subset ',
                            \'cd'   : '\cdot ',
                            \'lf'   : '\lfloor ',
                            \'rf'   : '\rfloor ',
                            \'fl'   : '\lfloor <+++> \rfloor <++>',
                            \'ha'   : '\hat{<+++>} <++>',
                            \}

                            " augroup quicktex
                            " autocmd!
                            " autocmd filetype markdown,pandoc,tex,org nnoremap <buffer><leader>q :so ~/.config/nvim/lua/config/quicktex.lua<CR>
                            " autocmd BufWritePost ~/.config/quicktex-shortcuts.vim so %
                            " augroup END
                            ]])
end

return {
	"brennier/quicktex",
    filetype = {"pandoc", "markdown", "org"},
	config = config,
}

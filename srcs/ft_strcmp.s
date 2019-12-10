# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybayart <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/06 21:55:38 by ybayart           #+#    #+#              #
#    Updated: 2019/12/08 18:08:12 by ybayart          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		section	.text
		global	_ft_strcmp

_ft_strcmp:
		push	rbp
		mov		rbp, rsp
		jmp		_do

_inc:
		inc		rdi
		inc		rsi

_do:
		mov		ch, BYTE [rdi]
		mov		cl, BYTE [rsi]

		test	cx, cx
		jz		_equal

		cmp		ch, cl
		je		_inc
		jg		_more
		jl		_less

		jmp		_inc

_equal:
		mov		rax, 0
		jmp		_end

_less:
		mov		rax, -1
		jmp		_end

_more:
		mov		rax, 1

_end:
		leave
		ret

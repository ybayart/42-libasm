# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybayart <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/08 16:13:07 by ybayart           #+#    #+#              #
#    Updated: 2019/12/08 18:08:44 by ybayart          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	section	.text
	global	_ft_read

_ft_read:
	push	rbp
	mov		rbp, rsp
	sub		rsp, 8

	cld
	mov		rax, 0x2000000 | 3
	syscall
	jc		_no

	mov		r8, rax

	cld
	mov		rax, 0x2000000 | 60
	xor		rdi, 0
	syscall

	mov		rax, r8

_end:
	add		rsp, 8
	leave
	ret

_no:
	mov		rax, -1
	jmp		_end

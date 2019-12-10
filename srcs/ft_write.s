# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybayart <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/06 22:57:03 by ybayart           #+#    #+#              #
#    Updated: 2019/12/08 18:08:31 by ybayart          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	section	.text
	global	_ft_write

_ft_write:
	push	rbp
	mov		rbp, rsp
	sub		rsp, 8

	mov		r8, rdx

	cld
	mov		rax, 0x2000000 | 4
	syscall
	jc		_error

	cld
	mov		rax, 0x2000000 | 60
	mov		rdi, 0
	syscall

	mov		rax, r8

_end:
	add		rsp, 8
	leave
	ret

_error:
	mov		rax, -1
	jmp		_end

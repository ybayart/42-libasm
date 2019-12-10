/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ybayart <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/06 16:16:18 by ybayart           #+#    #+#             */
/*   Updated: 2019/12/10 09:29:33 by ybayart          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include "libasm.h"

void	*ft_print_memory(void *addr, unsigned int size);

int			main(void)
{
	printf("\nft_strlen:\n");
	printf(" - |%zu| / |%zu|\n", ft_strlen("test"), strlen("test"));
	printf(" - |%zu| / |%zu|\n", ft_strlen("\0test"), strlen("\0test"));
	printf(" - |%zu| / |%zu|\n", ft_strlen("te\0st"), strlen("te\0st"));
	printf(" - |%zu| / |%zu|\n", ft_strlen(""), strlen(""));
	printf(" - |%zu| / |%zu|\n", ft_strlen("\0\0"), strlen("\0\0"));

	printf("\nft_strcpy:\n");
	char	*src = calloc(100, 1);
	char	*dst = calloc(100, 1);
	ft_strcpy(dst, (src = ""));
	printf(" - |%s| / |%s|\n", dst, src);
	ft_strcpy(dst, (src = "totooooooooooooooooooooo"));
	printf(" - |%s| / |%s|\n", dst, src);
	ft_strcpy(dst, (src = "tesst"));
	printf(" - |%s| / |%s|\n", dst, src);

	printf("\nft_strcmp:\n");
	src = "truc";
	dst = "truc";
	printf(" - |%d| / |%d|\n", ft_strcmp(dst, src), strcmp(dst, src));
	src = "abc";
	dst = "ab";
	printf(" - |%d| / |%d|\n", ft_strcmp(dst, src), strcmp(dst, src));
	src = "ab";
	dst = "abc";
	printf(" - |%d| / |%d|\n", ft_strcmp(dst, src), strcmp(dst, src));

	printf("\nft_write:\n");
	printf(" - |%zd| / |%zd|\n", ft_write(1, " toto\nnepasprint", 6), write(1, " toto\nnepasprint", 6));
	printf(" - |%zd| / |%zd|\n", ft_write(-42, " toto\nnepasprint", 6), write(-42, " toto\nnepasprint", 6));
	printf(" - |%zd| / |%zd|\n", ft_write(1, " toto\nnepasprint", 0), write(1, " toto\nnepasprint", 0));

	char	*path = "test/file";
	int		file1 = open(path, O_RDWR);
	int		file2 = open(path, O_RDWR);
	int		size = 6000;
	char	buf1[size];
	char	buf2[size];
	printf("\nft_read:\n");
	printf(" - |%zd|: |%.*s|\n   |%zd|: |%.*s|\n", ft_read(file1, buf1, size), size , buf1, read(file2, buf2, size), size, buf2);
	file1 = -42;
	file2 = -42;
	printf(" - |%zd| / |%zd|\n", ft_read(file1, buf1, size), read(file2, buf2, size));
	close(file1);
	close(file2);

	printf("\nft_strdup:\n");
	char	*str;
	printf(" - |%s|\n", (str = ft_strdup("abcdefghijklmnopqrstuvwxyz")));
	free(str);

	printf("\nft_atoi_base:\n");

	printf("\nft_list_push_front:\n");
	t_list	*lst;
	lst = NULL;
	ft_list_push_front(&lst, ft_strdup("abc"));
	ft_list_push_front(&lst, ft_strdup("420"));
	ft_list_push_front(&lst, ft_strdup("bcd"));
	ft_list_push_front(&lst, ft_strdup("def"));
	ft_list_push_front(&lst, ft_strdup("420"));
	ft_list_push_front(&lst, ft_strdup("cde"));
	ft_list_push_front(&lst, ft_strdup("cde"));
	ft_list_push_front(&lst, ft_strdup("420"));
	ft_list_push_front(&lst, ft_strdup("420"));
	ft_list_push_front(&lst, ft_strdup("cde"));
	ft_list_push_front(&lst, ft_strdup("cde"));
	ft_list_push_front(&lst, ft_strdup("420"));
	ft_list_push_front(&lst, ft_strdup("too"));
	ft_list_push_front(&lst, ft_strdup("420"));
	ft_list_push_front(&lst, ft_strdup("tot"));
	ft_list_push_front(&lst, ft_strdup("420"));
	t_list	*tmp;
	tmp = lst;
	while (tmp != NULL)
	{
		write(1, " - ", 3);
		write(1, tmp->data, ft_strlen(tmp->data));
		tmp = tmp->next;
	}
	printf("\n");
	// ft_print_memory(lst->next->next->next, 256);

	printf("\nft_list_size:\n");
	printf(" - %d\n", ft_list_size(tmp));
	printf(" - %d\n", ft_list_size(lst));
	printf(" - %d\n", ft_list_size(NULL));

	printf("\nft_list_sort:\n");
	tmp = lst;
	while (tmp != NULL)
	{
		write(1, " - ", 3);
		write(1, tmp->data, ft_strlen(tmp->data));
		tmp = tmp->next;
	}
	printf("\n");
	ft_list_sort(&lst, ft_strcmp);
	tmp = lst;
	while (tmp != NULL)
	{
		write(1, " - ", 3);
		write(1, tmp->data, ft_strlen(tmp->data));
		tmp = tmp->next;
	}
	printf("\n");

	printf("\nft_list_remove_if:\n");
	ft_list_remove_if(&lst, "420", ft_strcmp, free);
	ft_list_remove_if(&lst, "cde", ft_strcmp, free);
	tmp = lst;
	while (tmp != NULL)
	{
		write(1, " - ", 3);
		write(1, tmp->data, ft_strlen(tmp->data));
		tmp = tmp->next;
	}
	printf("\n");
	while (1);
}

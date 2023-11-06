/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tgrekov <tgrekov@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/26 15:41:34 by tgrekov           #+#    #+#             */
/*   Updated: 2023/11/06 13:34:29 by tgrekov          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/**
 * @file ft_split.c
 * @dontinclude ft_split.c
 * @line /\* *********
 * @until /\* *********
 */

#include "libft.h"

static void	skip_chars(char const **s, char c)
{
	while (**s && **s == c)
		(*s)++;
}

static size_t	count_sections(char const *s, char c)
{
	size_t	i;

	if (!*s)
		return (0);
	i = 1;
	while (*s)
	{
		if (*s == c)
		{
			skip_chars(&s, c);
			if (*s)
				i++;
		}
		else
			s++;
	}
	return (i);
}

static char	**free_all(char **arr)
{
	size_t	i;

	i = 0;
	while (arr[i])
		free(arr[i++]);
	free(arr);
	return (0);
}

/**
 * @brief Split null-terminated string @p s by characer @p c into allocated
 * array of freeable, null-terminated strings, with @p NULL as the last element
 * 
 * @param[in] s Null-terminated string to split
 * @param[in] c Character to split on
 * @retval char** Allocated array of allocated string pointers,
 * with @p NULL as the last element
 */
char	**ft_split(char const *s, char c)
{
	char	**arr;
	size_t	arr_i;
	size_t	len;

	if (!s)
		return (0);
	skip_chars(&s, c);
	arr = ft_calloc(count_sections(s, c) + 1, sizeof(char *));
	if (!arr)
		return (0);
	arr_i = 0;
	while (*s)
	{
		len = 0;
		while (s[len] && s[len] != c)
			len++;
		arr[arr_i] = ft_substr(s, 0, len);
		if (!arr[arr_i++])
			return (free_all(arr));
		s += len;
		skip_chars(&s, c);
	}
	return (arr);
}

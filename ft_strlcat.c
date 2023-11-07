/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlcat.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tgrekov <tgrekov@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/24 17:59:54 by tgrekov           #+#    #+#             */
/*   Updated: 2023/11/06 13:49:31 by tgrekov          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/**
 * @file ft_strlcat.c
 * @dontinclude ft_strlcat.c
 * @line /\* *********
 * @until /\* *********
 */

#include "libft.h"

/**
 * @brief Appends at most <tt>dstsize - @ref ft_strlen"ft_strlen"(dst) - 1</tt>
 * characters of string @p src to the end of string @p dst
 * 
 * Null-terminates @p dst if <tt>dstsize != 0</tt> and
 * <tt>@ref ft_strlen"ft_strlen"(dst) < dstsize</tt>
 * 
 * @param dst 
 * @param src 
 * @param dstsize 
 * @retval size_t 
 */
size_t	ft_strlcat(char *dst, const char *src, size_t dstsize)
{
	size_t	src_len;
	size_t	dst_len;
	size_t	i;

	src_len = ft_strlen(src);
	if (!dstsize)
		return (src_len);
	dst_len = ft_strlen(dst);
	if (dstsize < dst_len)
		return (src_len + dstsize);
	i = 0;
	while (src[i] && (i + dst_len + 1) < dstsize)
	{
		dst[dst_len + i] = src[i];
		i++;
	}
	dst[dst_len + i] = '\0';
	return (src_len + dst_len);
}

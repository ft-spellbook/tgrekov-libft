/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_calloc.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tgrekov <tgrekov@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/25 14:33:28 by tgrekov           #+#    #+#             */
/*   Updated: 2023/10/26 15:28:57 by tgrekov          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_calloc(size_t count, size_t size)
{
	char	*ptr;
	size_t	bsize;

	bsize = count * size;
	if (bsize / count != size)
		return (0);
	if (!bsize)
		return (ft_calloc(1, 1));
	ptr = malloc(bsize);
	if (!ptr)
		return (0);
	while (bsize--)
		ptr[bsize] = 0;
	return (ptr);
}

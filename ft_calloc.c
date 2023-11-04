/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_calloc.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tgrekov <tgrekov@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/25 14:33:28 by tgrekov           #+#    #+#             */
/*   Updated: 2023/11/04 09:42:13 by tgrekov          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_calloc(size_t count, size_t size)
{
	void	*ptr;
	size_t	bsize;

	if (!count && !size)
		return (ft_calloc(1, 1));
	if (!count || !size)
		return (0);
	bsize = count * size;
	if (bsize / count != size)
		return (0);
	ptr = malloc(bsize);
	if (!ptr)
		return (0);
	ft_bzero(ptr, bsize);
	return (ptr);
}

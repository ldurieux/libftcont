/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_vector_pop_back.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ldurieux <ldurieux@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/06 19:10:35 by ldurieux          #+#    #+#             */
/*   Updated: 2022/09/06 19:10:36 by ldurieux         ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "ft_vector.h"

void	*ft_vector_pop_back(t_ftvector *this)
{
	void	*res;
	size_t	data_size;

	if (!this || this->size == 0)
		return (NULL);
	res = malloc(this->_data_size);
	if (!res)
		return (NULL);
	data_size = this->_data_size;
	this->size--;
	ft_memcpy(res, ((char *)this->data + data_size * this->size), data_size);
	return (res);
}

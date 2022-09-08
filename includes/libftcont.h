/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libftcont.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ldurieux <ldurieux@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/08 12:27:46 by ldurieux          #+#    #+#             */
/*   Updated: 2022/09/08 12:27:47 by ldurieux         ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTCONT_H
# define LIBFTCONT_H

# include "libft.h"
# include "ft_vector.h"
# include "ft_frwlist.h"
# include "ft_list.h"
# include "ft_queue.h"
# include "ft_stack.h"
# include "ft_map.h"

enum e_ftvariant_type
{
	Var_Invalid,
	Var_Undefined,
	Var_Bool,
	Var_Int,
	Var_Uint,
	Var_Float,
	Var_Char,
	Var_String,
	Var_Array,
	Var_Vector,
	Var_List,
	Var_Map,
	Var_VoidStar,
	Var_UserDefined,
};

typedef struct s_ftvariant
{
	int	type;
	union
	{
		t_bool		bool;
		t_int64		integer;
		t_uint64	u_integer;
		double		floating;
		char		character;
		char		*string;
		void		*array;
		t_ftvector	*vector;
		t_ftlist	*list;
		t_ftmap		*map;
		void		*ptr;
	};
}	t_ftvariant;

#endif // LIBFTCONT_H

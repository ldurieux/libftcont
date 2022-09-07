SRCS =  \
		main.c \
		srcs/ft_vector/ft_vector_delete.c \
		srcs/ft_vector/ft_vector_new.c \
		srcs/ft_vector/ft_vector_pop_back.c \
		srcs/ft_vector/ft_vector_push_back.c \
		srcs/ft_vector/ft_vector_reserve.c \
		srcs/ft_stack/ft_stack_delete.c \
		srcs/ft_stack/ft_stack_new.c \
		srcs/ft_stack/ft_stack_pop.c \
		srcs/ft_stack/ft_stack_push.c \
		srcs/ft_queue/ft_queue_delete.c \
		srcs/ft_queue/ft_queue_new.c \
		srcs/ft_queue/ft_queue_pop.c \
		srcs/ft_queue/ft_queue_push.c \
		srcs/ft_list/ft_list_at.c \
		srcs/ft_list/ft_list_delete.c \
		srcs/ft_list/ft_list_insert.c \
		srcs/ft_list/ft_list_new.c \
		srcs/ft_list/ft_list_remove.c \
		srcs/ft_frwlist/ft_frwlist_at.c \
		srcs/ft_frwlist/ft_frwlist_delete.c \
		srcs/ft_frwlist/ft_frwlist_insert.c \
		srcs/ft_frwlist/ft_frwlist_new.c \
		srcs/ft_frwlist/ft_frwlist_remove.c \

LIBS =	\
		-lft \

HEADERS = includes/

LIB_NAMES	= $(subst -l,lib,$(LIBS))
LIB_LD		= $(foreach lib,$(LIB_NAMES),-L$(lib))
LIB_PATHS	= $(foreach lib,$(LIB_NAMES),$(lib)/$(lib).a)
LIB_HEADERS	= $(foreach lib,$(LIB_NAMES),-I$(lib)/includes/)

OBJS		= ${SRCS:.c=.o}
DEPS		= ${SRCS:.c=.d}
CC			= gcc
CCFLAGS		= -Wall -Wextra -g
DEPSFLAGS	= -MMD -MP
NAME		= libftcont
RM			= rm -f
MAKE		= make -C
WRAP		= 
AR			= ar
AR_FLAGS	= rc

.PHONY: all clean fclean re

$(NAME) : $(LIB_PATHS) $(OBJS)
		$(CC) $(WRAP) $(CCFLAGS) -I$(HEADERS) $(LIB_HEADERS) -o $@ $(OBJS) $(LIB_LD) $(LIBS)

$(LIB_PATHS) :
		$(MAKE) $(notdir $(basename $@))

all : $(NAME)

clean :
		-$(RM) $(OBJS) $(DEPS)

fclean : clean
		$(foreach lib, $(LIB_NAMES), \
			$(MAKE) $(lib) fclean; \
		)
		-$(RM) $(NAME)

re : fclean all

-include $(DEPS)

%.o : %.c Makefile
		$(CC) $(CCFLAGS) $(DEPSFLAGS) -I$(HEADERS) $(LIB_HEADERS) -c $< -o $@ $(LIB_LD) $(LIBS)

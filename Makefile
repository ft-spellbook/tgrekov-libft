NAME = libft.a
CC = cc
CFLAGS = -Wall -Wextra -Werror

SRC_DIR =
OBJ_DIR = objs/

SRC_NAMES =	ft_atoi					\
			ft_bzero				\
			ft_calloc				\
			ft_isalnum				\
			ft_isalpha				\
			ft_isascii				\
			ft_isdigit				\
			ft_isprint				\
			ft_itoa					\
			ft_memchr				\
			ft_memcmp				\
			ft_memcpy				\
			ft_memmove				\
			ft_memset				\
			ft_putchar_fd			\
			ft_putendl_fd			\
			ft_putnbr_fd			\
			ft_putstr_fd			\
			ft_split				\
			ft_strchr				\
			ft_strdup				\
			ft_striteri				\
			ft_strjoin				\
			ft_strlcat				\
			ft_strlcpy				\
			ft_strlen				\
			ft_strmapi				\
			ft_strncmp				\
			ft_strnstr				\
			ft_strrchr				\
			ft_strtrim				\
			ft_substr				\
			ft_tolower				\
			ft_toupper

SRC_BONUS_NAMES =	ft_lstadd_back_bonus	\
					ft_lstadd_front_bonus	\
					ft_lstclear_bonus		\
					ft_lstdelone_bonus		\
					ft_lstiter_bonus		\
					ft_lstlast_bonus		\
					ft_lstmap_bonus			\
					ft_lstnew_bonus			\
					ft_lstsize_bonus

HEADERS = libft.h

SRCS = $(addprefix $(SRC_DIR), $(addsuffix .c, $(SRC_NAMES)))
OBJS = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_NAMES)))

SRCS_BONUS = $(addprefix $(SRC_DIR), $(addsuffix .c, $(SRC_BONUS_NAMES)))
OBJS_BONUS = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_BONUS_NAMES)))

#Non-filename targets
.PHONY: bonus all clean fclean re docs untrack

# $@ name of the rule
# $^ prerequisite of the rule
# $< first prerequisite
$(OBJ_DIR)%.o: $(SRC_DIR)%.c $(HEADERS)
	@mkdir -p $(OBJ_DIR)$(subst $(SRC_DIR),,$(dir $<))
	@echo Building $<
	@$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJS)
	@ar rcs $(NAME) $^
	@echo Mandatory part done

bonus: $(NAME) $(OBJS_BONUS)
	@ar rcs $(NAME) $^
	@echo Bonus part done

all: $(NAME)

clean:
	@echo Removing $(OBJ_DIR)
	@rm -rf $(OBJ_DIR)

fclean: clean
	@echo Removing $(NAME)
	@rm -f $(NAME)

re: fclean all
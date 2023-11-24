#Name of archive
NAME = libft.a
#Name of debugging executable
DEBUG_NAME = debug.out
#Name of leak debugging executable
DEBUG_LEAKS_NAME = debug_leaks.out

#Compiler
CC = cc
#Compiler flags
CFLAGS = -Wall -Wextra -Werror
#Compiler flags to use for debugging
DEBUG_FLAGS = -g -fsanitize=address,undefined,integer
#Compiler flags to use for debugging leaks
DEBUG_LEAKS_FLAGS = -g

#Directory where source files are located
SRC_DIR =
#Directory for object subdirectories
OBJ_BASE_DIR = objs/
#Directory for objects from standard builds
OBJ_DIR = $(OBJ_BASE_DIR)standard/
#Directory for objects from debug builds
DEBUG_OBJ_DIR = $(OBJ_BASE_DIR)debug/
#Directory for objects from leak debug builds
DEBUG_LEAKS_OBJ_DIR = $(OBJ_BASE_DIR)debug_leaks/

#List of source files
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

#List of bonus source files
SRC_BONUS_NAMES =	ft_lstadd_back_bonus	\
					ft_lstadd_front_bonus	\
					ft_lstclear_bonus		\
					ft_lstdelone_bonus		\
					ft_lstiter_bonus		\
					ft_lstlast_bonus		\
					ft_lstmap_bonus			\
					ft_lstnew_bonus			\
					ft_lstsize_bonus

#List of headers
HEADERS = libft.h

#### END OF CONFIGURABLE SECTION ####

#Prepend SRC_DIR and append .c to all source files
SRCS = $(addprefix $(SRC_DIR), $(addsuffix .c, $(SRC_NAMES)))
#Prepend OBJ_DIR and append .o to all would-be object files
OBJS = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_NAMES)))
#Prepend OBJ_DIR and append .o to all would-be debug object files
DEBUG_OBJS = $(addprefix $(DEBUG_OBJ_DIR), $(addsuffix .o, $(SRC_NAMES)))
#Prepend OBJ_DIR and append .o to all would-be leak debug object files
DEBUG_LEAKS_OBJS = $(addprefix $(DEBUG_LEAKS_OBJ_DIR), $(addsuffix .o, $(SRC_NAMES)))

#Prepend SRC_DIR and append .c to all bonus source files
SRCS_BONUS = $(addprefix $(SRC_DIR), $(addsuffix .c, $(SRC_BONUS_NAMES)))
#Prepend OBJ_DIR and append .o to all would-be bonus object files
OBJS_BONUS = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_BONUS_NAMES)))
#Prepend OBJ_DIR and append .o to all would-be debug bonus object files
DEBUG_OBJS_BONUS = $(addprefix $(DEBUG_OBJ_DIR), $(addsuffix .o, $(SRC_BONUS_NAMES)))
#Prepend OBJ_DIR and append .o to all would-be leak debug bonus object files
DEBUG_LEAKS_OBJS_BONUS = $(addprefix $(DEBUG_LEAKS_OBJ_DIR), $(addsuffix .o, $(SRC_BONUS_NAMES)))

#Set non-filename targets so make doesn't skip due
#to files unintentionally having the same name as a rule
.PHONY: all bonus \
debug_set debug \
debug_leaks_set debug_leaks \
clean fclean re 

# $@ name of the rule
# $^ prerequisite of the rule
# $< first prerequisite
# Build any object files that need recompilation
$(OBJ_DIR)%.o \
$(DEBUG_OBJ_DIR)%.o \
$(DEBUG_LEAKS_OBJ_DIR)%.o: $(SRC_DIR)%.c $(HEADERS)
#	Take the directory path of the file that needs to be built, remove
#	the SRC_DIR portion and replace it with OBJ_DIR instead, and
#	create that directory.

#	We use $< so that we don't get the HEADERS here also. They are included
#	above so modifying the headers can trigger recompilation
	@mkdir -p $(OBJ_DIR)$(subst $(SRC_DIR),,$(dir $<))
	@echo Building $< with $(CFLAGS)
	@$(CC) $(CFLAGS) -c $< -o $@

#Create archive from objects
$(NAME): $(OBJS)
	@ar rcs $(NAME) $^
	@echo Mandatory part done

all: $(NAME)

#Create archive from objects + bonus objects
.bonus: $(NAME) $(OBJS_BONUS)
	@ar rcs $(NAME) $^
	@echo Bonus part done
	@touch .bonus

bonus: .bonus

#Compile debug executable with debug flags
$(DEBUG_NAME): $(DEBUG_OBJS) $(DEBUG_OBJS_BONUS)
	@echo Compiling debug executable
	@$(CC) $(CFLAGS) $(OBJS) -o $@
	@echo Debug done

#Set debug flags, debug object directory, and debug objects
debug_set:
	$(eval CFLAGS = $(DEBUG_FLAGS))
	$(eval OBJ_DIR = $(DEBUG_OBJ_DIR))
	$(eval OBJS = $(DEBUG_OBJS) $(DEBUG_OBJS_BONUS))

debug: debug_set $(DEBUG_NAME)

#Compile memory leak debug executable with debug flags
$(DEBUG_LEAKS_NAME): $(DEBUG_LEAKS_OBJS) $(DEBUG_LEAKS_OBJS_BONUS)
	@echo Compiling leaks debug executable
	@$(CC) $(DEBUG_LEAKS_FLAGS) $(DEBUG_LEAKS_OBJS) $(DEBUG_LEAKS_OBJS_BONUS) -o $@
	@echo Leaks debug done

#Set leak debug flags, leak debug object directory, and leak debug objects
debug_leaks_set:
	$(eval CFLAGS = $(DEBUG_LEAKS_FLAGS))
	$(eval OBJ_DIR = $(DEBUG_LEAKS_OBJ_DIR))

debug_leaks: debug_leaks_set $(DEBUG_LEAKS_NAME)

#Clean up resources generated during build
clean:
	@echo Removing $(OBJ_BASE_DIR) and .bonus
	@rm -rf $(OBJ_BASE_DIR) .bonus

#Clean up build artifacts
fclean: clean
	@echo Removing $(NAME), $(DEBUG_NAME), and $(DEBUG_LEAKS_NAME)
	@rm -rf $(NAME) $(DEBUG_NAME) $(DEBUG_LEAKS_NAME)

re: fclean all

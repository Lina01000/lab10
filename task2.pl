% Dataset: username and password
user(lina, '1234').
user(sara, '5678').
user(nora, 'abcd').

% Start login with 3 attempts
login :-
    login_attempt(3).

% No attempts remaining
login_attempt(0) :-
    write('Sorry, you exceeded the maximum number of attempts, try again later.'),
    nl.

% Read and check credentials
login_attempt(Attempts) :-
    Attempts > 0,

    write('Enter username: '),
    read(Username),

    write('Enter password: '),
    read(Password),

    (   user(Username, Password)
    ->  write('Login Successful'),
        nl
    ;   write('Login Unsuccessful'),
        nl,
        Remaining is Attempts - 1,
        login_attempt(Remaining)
    ).
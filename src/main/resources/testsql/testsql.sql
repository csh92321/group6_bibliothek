create table test_meet_board(
id varchar2(20) primary key not null,
write_num number not null,
savedate date default sysdate,
content varchar2(1000)
);
create sequence test_meet_board_seq;
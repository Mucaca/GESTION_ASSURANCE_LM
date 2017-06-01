create  table CLIENT ( 	NUMCLIENT integer(12) not null,
							NOM char (32) not null,
							ADRESSE char (64) not null,
						constraint PK_CLIENT primary key (NUMCLIENT));
									
create table VEHICULE ( NUMVEH integer(12) not null,
						MARQUE char(32) not null,
						MODELE char(32) not null,
						ANNEE year(1) not null,
						CYLINDREE int(4) not null,
						SIGNATAIRE char(32) not null,
						NUMCTR int(12) not null,
						NUMCLIENT int(12) not null,
					constraint PK_VEHICULE primary key (NUMVEH),
					constraint FK_VEHICULE_CLIENT foreign key (NUMCLIENT) references CLIENT(NUMCLIENT)
                    on delete no action on update cascade,
                    constraint FK_VEHICULE_CONTRAT foreign key (SIGNATAIRE,NUMCTR) references CONTRAT(SIGNATAIRE,NUMCTR)
                    on delete no action on update cascade
					);

create table IMPLICATION ( NUMACC int (12) not null,
						 NUMVEH int(12) not null,
						constraint PK_IMPLICATION primary key (NUMACC),
						constraint FK_IMPLICATION_VEHICULE foreign key (NUMVEH) references VEHICULE(NUMVEH)
                        on delete no action on update cascade
						);

create table CONTRAT (  SIGNATAIRE char(32) not null,
						NUMCTR int (12) not null,
						TYPE char (12) not null,
						DATESIGN date(3) not null,
						constraint PK_CONTRAT primary key (SIGNATAIRE),
						constraint FK_CONTRAT_CONTRAT foreign key (NUMCTR) references CONTRAT(SIGNATAIRE)
                        on delete no action on update cascade
						);

create table ACCIDENT ( NUMACC char(12) not null,
						DATEACC date(3) not null,
						MONTANT money(12),
					constraint PK_ACCIDENT primary key (NUMACC)
					);
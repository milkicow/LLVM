Х_ХЭМЖЭЭ = 50;
У_ХЭМЖЭЭ = 25;

ХЭМЖЭЭ = 40;

гэр[1250];
удаадахи_гэр[1250];

минии_хүршэнэр = 0;
таблица_х = 0;
таблица_у = 0;

мүнөөнэй_х = 0;
мүнөөнэй_у = 0;

х = 0;
у = 0;

хүршэнэр_үүргэ_тоолуур = 0;

хубилагша_хүршэнэр_х = 0;
хубилагша_хүршэнэр_у = 0;

журам эхилхэ хүршэнэр
    хүршэнэр_үүргэ_тоолуур = хүршэнэр_үүргэ_тоолуур + 1;
    минии_хүршэнэр = 0;
    таблица_х = 0;
    таблица_у = 0;

    хубилагша_хүршэнэр_у = мүнөөнэй_у - 1;
    урагша цикл_у;
    цикл_у:
    haa хубилагша_хүршэнэр_у <= (мүнөөнэй_у + 1) тиихэдээ дабталга_у ондоогоор цикл_у_түгэсхэл
    дабталга_у:

        # for у body

        хубилагша_хүршэнэр_х = мүнөөнэй_х - 1;
        урагша цикл_х;
        цикл_х:
        haa хубилагша_хүршэнэр_х <= (мүнөөнэй_х + 1) тиихэдээ дабталга_х ондоогоор цикл_х_түгэсхэл
        дабталга_х:

            # for х body
            таблица_х = хубилагша_хүршэнэр_х;
            таблица_у = хубилагша_хүршэнэр_у;

            haa (хубилагша_хүршэнэр_х < 0) тиихэдээ х_тэгһээ_бага ондоогоор х_тэгһээ_бага_түгэсхэл
            х_тэгһээ_бага:
                таблица_х = Х_ХЭМЖЭЭ + хубилагша_хүршэнэр_х;
                урагша х_тэгһээ_бага_түгэсхэл;
            х_тэгһээ_бага_түгэсхэл:

            haa (хубилагша_хүршэнэр_х >= Х_ХЭМЖЭЭ) тиихэдээ х_ехэ_х_хэмжээ ондоогоор х_ехэ_х_хэмжээ_түгэсхэл
            х_ехэ_х_хэмжээ:
                таблица_х = хубилагша_хүршэнэр_х - Х_ХЭМЖЭЭ;
                урагша х_ехэ_х_хэмжээ_түгэсхэл;
            х_ехэ_х_хэмжээ_түгэсхэл:

            haa (хубилагша_хүршэнэр_у < 0) тиихэдээ у_тэгһээ_бага ондоогоор у_тэгһээ_бага_түгэсхэл
            у_тэгһээ_бага:
                таблица_у = У_ХЭМЖЭЭ + хубилагша_хүршэнэр_у;
                урагша у_тэгһээ_бага_түгэсхэл;
            у_тэгһээ_бага_түгэсхэл:


            haa (хубилагша_хүршэнэр_у >= У_ХЭМЖЭЭ) тиихэдээ у_ехэ_у_хэмжээ ондоогоор у_ехэ_у_хэмжээ_түгэсхэл
            у_ехэ_у_хэмжээ:
                таблица_у = хубилагша_хүршэнэр_у - У_ХЭМЖЭЭ;
                урагша у_ехэ_у_хэмжээ_түгэсхэл;
            у_ехэ_у_хэмжээ_түгэсхэл:


            haa ((хубилагша_хүршэнэр_х == мүнөөнэй_х) && (хубилагша_хүршэнэр_у == мүнөөнэй_у)) тиихэдээ цикл_х_үргэлжэлүүлхэ ондоогоор цикл_х_үргэлжэлүүлхэ_түгэсхэл
            цикл_х_үргэлжэлүүлхэ_түгэсхэл:

            минии_хүршэнэр = минии_хүршэнэр + гэр[таблица_у * Х_ХЭМЖЭЭ + таблица_х];
            # for х body end
            урагша цикл_х_үргэлжэлүүлхэ;
            цикл_х_үргэлжэлүүлхэ:

            хубилагша_хүршэнэр_х = хубилагша_хүршэнэр_х + 1;
            урагша цикл_х;
        цикл_х_түгэсхэл:

        # for у body end

        хубилагша_хүршэнэр_у = хубилагша_хүршэнэр_у + 1;
        урагша цикл_у;
    цикл_у_түгэсхэл:
журам түгэсхэл

алха_у_тоолуур = 0;
алха_х_тоолуур = 0;

хубилагша_алха_х = 0;
хубилагша_алха_у = 0;


журам эхилхэ алха
    минии_хүршэнэр = 0;

    хубилагша_алха_у = 0;
    урагша цикл_у_түгэсхэл_хоёр;
    цикл_у_түгэсхэл_хоёр:
    haa хубилагша_алха_у < У_ХЭМЖЭЭ тиихэдээ алха_у ондоогоор цикл_у_түгэсхэл_хоёр_түгэсхэл
    алха_у:
        алха_у_тоолуур = алха_у_тоолуур + 1;
        # for у body

        хубилагша_алха_х = 0;
        урагша цикл_х_түгэсхэл_хоёр;
        цикл_х_түгэсхэл_хоёр:
        haa хубилагша_алха_х < Х_ХЭМЖЭЭ тиихэдээ алха_х ондоогоор цикл_х_түгэсхэл_хоёр_түгэсхэл
        алха_х:
            алха_х_тоолуур = алха_х_тоолуур + 1;
            # for х body
            мүнөөнэй_х = хубилагша_алха_х;
            мүнөөнэй_у = хубилагша_алха_у;

            дуудалгануудай журам хүршэнэр;

            haa гэр[хубилагша_алха_у * Х_ХЭМЖЭЭ + хубилагша_алха_х] тиихэдээ амидарха ондоогоор үхэһэн
            амидарха:

                haa минии_хүршэнэр == 2 || минии_хүршэнэр == 3 тиихэдээ амиды_удаадахи_эс ондоогоор удаадахи_эс_үхөө
                амиды_удаадахи_эс:
                    удаадахи_гэр[хубилагша_алха_у * Х_ХЭМЖЭЭ + хубилагша_алха_х] = 1;
                    урагша нэгэниие_түгэсхэхэ;
                удаадахи_эс_үхөө:
                    удаадахи_гэр[хубилагша_алха_у * Х_ХЭМЖЭЭ + хубилагша_алха_х] = 0;
                    урагша нэгэниие_түгэсхэхэ;

                нэгэниие_түгэсхэхэ:
                урагша гурбадахи_түгэсхэл;
            үхэһэн:

                haa минии_хүршэнэр == 3 тиихэдээ удаадахи_эс ондоогоор үгы_удаадахи_эс
                удаадахи_эс:
                    удаадахи_гэр[хубилагша_алха_у * Х_ХЭМЖЭЭ + хубилагша_алха_х] = 1;
                    урагша хоёрдохи_түгэсхэл;

                үгы_удаадахи_эс:
                    удаадахи_гэр[хубилагша_алха_у * Х_ХЭМЖЭЭ + хубилагша_алха_х] = 0;
                    урагша хоёрдохи_түгэсхэл;

                хоёрдохи_түгэсхэл:

                урагша гурбадахи_түгэсхэл;
            гурбадахи_түгэсхэл:

            # for х body end
            хубилагша_алха_х = хубилагша_алха_х + 1;
            урагша цикл_х_түгэсхэл_хоёр;
        цикл_х_түгэсхэл_хоёр_түгэсхэл:

        # for у body end
        хубилагша_алха_у = хубилагша_алха_у + 1;
        урагша цикл_у_түгэсхэл_хоёр;
    цикл_у_түгэсхэл_хоёр_түгэсхэл:

журам түгэсхэл

тоо = 0;
хайрсаг = 0;

журам эхилхэ һэлгэлтэ
    тоо = 0;
    хайрсаг = 0;

    урагша хуулбари;
    хуулбари:
    haa тоо < 1250 тиихэдээ хуулбари_дабталга ондоогоор хуулбари_түгэсхэл
    хуулбари_дабталга:
        хайрсаг = гэр[тоо];
        гэр[тоо] = удаадахи_гэр[тоо];
        удаадахи_гэр[тоо] = гэр[тоо];

        тоо = тоо + 1;
        урагша хуулбари;
    хуулбари_түгэсхэл:

журам түгэсхэл


хүдэлхэ = 0;

журам эхилхэ аба

    # гэр[1 * Х_ХЭМЖЭЭ + 2] = 1;
    # гэр[2 * Х_ХЭМЖЭЭ + 3] = 1;
    # гэр[2 * Х_ХЭМЖЭЭ + 4] = 1;
    # гэр[3 * Х_ХЭМЖЭЭ + 2] = 1;
    # гэр[3 * Х_ХЭМЖЭЭ + 3] = 1;

    гэр[1 * Х_ХЭМЖЭЭ + 26] = 1;
    гэр[2 * Х_ХЭМЖЭЭ + 24] = 1;
    гэр[2 * Х_ХЭМЖЭЭ + 26] = 1;
    гэр[3 * Х_ХЭМЖЭЭ + 14] = 1;
    гэр[3 * Х_ХЭМЖЭЭ + 15] = 1;
    гэр[3 * Х_ХЭМЖЭЭ + 22] = 1;
    гэр[3 * Х_ХЭМЖЭЭ + 23] = 1;
    гэр[3 * Х_ХЭМЖЭЭ + 36] = 1;
    гэр[3 * Х_ХЭМЖЭЭ + 37] = 1;
    гэр[4 * Х_ХЭМЖЭЭ + 13] = 1;
    гэр[4 * Х_ХЭМЖЭЭ + 17] = 1;
    гэр[4 * Х_ХЭМЖЭЭ + 22] = 1;
    гэр[4 * Х_ХЭМЖЭЭ + 23] = 1;
    гэр[4 * Х_ХЭМЖЭЭ + 36] = 1;
    гэр[4 * Х_ХЭМЖЭЭ + 37] = 1;
    гэр[5 * Х_ХЭМЖЭЭ + 2] = 1;
    гэр[5 * Х_ХЭМЖЭЭ + 3] = 1;
    гэр[5 * Х_ХЭМЖЭЭ + 12] = 1;
    гэр[5 * Х_ХЭМЖЭЭ + 18] = 1;
    гэр[5 * Х_ХЭМЖЭЭ + 22] = 1;
    гэр[5 * Х_ХЭМЖЭЭ + 23] = 1;
    гэр[6 * Х_ХЭМЖЭЭ + 2] = 1;
    гэр[6 * Х_ХЭМЖЭЭ + 3] = 1;
    гэр[6 * Х_ХЭМЖЭЭ + 12] = 1;
    гэр[6 * Х_ХЭМЖЭЭ + 16] = 1;
    гэр[6 * Х_ХЭМЖЭЭ + 18] = 1;
    гэр[6 * Х_ХЭМЖЭЭ + 19] = 1;
    гэр[6 * Х_ХЭМЖЭЭ + 24] = 1;
    гэр[6 * Х_ХЭМЖЭЭ + 26] = 1;
    гэр[7 * Х_ХЭМЖЭЭ + 12] = 1;
    гэр[7 * Х_ХЭМЖЭЭ + 18] = 1;
    гэр[7 * Х_ХЭМЖЭЭ + 26] = 1;
    гэр[8 * Х_ХЭМЖЭЭ + 13] = 1;
    гэр[8 * Х_ХЭМЖЭЭ + 17] = 1;
    гэр[9 * Х_ХЭМЖЭЭ + 14] = 1;
    гэр[9 * Х_ХЭМЖЭЭ + 15] = 1;

    хүдэлхэ = 0;
    урагша цикл_алха;
    цикл_алха:
    haa хүдэлхэ < 1000 тиихэдээ алхам_дабталга ондоогоор цикл_алхам_түгэсхэл
    алхам_дабталга:
        # алха body

        у = 0;
        урагша у_цикл;
        у_цикл:
        haa у < У_ХЭМЖЭЭ тиихэдээ у_цикл_дабталга ондоогоор у_цикл_түгэсхэл
        у_цикл_дабталга:
            # у loop body

            х = 0;
            урагша х_цикл;
            х_цикл:
            haa х < Х_ХЭМЖЭЭ тиихэдээ х_цикл_дабталга ондоогоор х_цикл_түгэсхэл
            х_цикл_дабталга:
                # х loop body
                haa гэр[у * Х_ХЭМЖЭЭ + х] тиихэдээ хара ондоогоор сагаан
                хара:
                    зураха(х, у, 4278190080, ХЭМЖЭЭ);
                    урагша үнгэ_түгэсхэл;
                сагаан:
                    зураха(х, у, 4294967295, ХЭМЖЭЭ);
                    урагша үнгэ_түгэсхэл;

                үнгэ_түгэсхэл:

                # х loop end

                х = х + 1;
                урагша х_цикл;
            х_цикл_түгэсхэл:

            # у loop body end
            у = у + 1;
            урагша у_цикл;
        у_цикл_түгэсхэл:

        сэбэр;

        дуудалгануудай журам алха;
        дуудалгануудай журам һэлгэлтэ;
        # swap гэр удаадахи_гэр;

        # алха body end
        хүдэлхэ = хүдэлхэ + 1;
        урагша цикл_алха;
    цикл_алхам_түгэсхэл:

журам түгэсхэл

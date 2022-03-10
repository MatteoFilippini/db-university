-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`,`students`.`surname`
FROM `students`
INNER JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name`='Corso di Laurea in Economia'

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `degrees`.`name`
FROM `degrees` 
JOIN `departments`
ON `departments`.`id`=`degrees`.`department_id`
WHERE `departments`.`name`='Dipartimento di Neuroscienze'

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT C.`name`
FROM `courses` AS C
JOIN `course_teacher` AS CT
ON C.`id`= CT.`course_id`
JOIN `teachers` AS T
ON T.`id`= CT.`teacher_id`
WHERE T.`name`='Fulvio'
AND T.`surname`='Amato'

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti 
--e il relativo dipartimento, 
--in ordine alfabetico per cognome e nome
SELECT S.`name` as `studente`,D.`name` as `corso`,DD.`name` as `dipartimento`
FROM `students` S
JOIN `degrees` D
ON D.`id` = S.`degree_id`

JOIN `departments` DD
ON DD.`id` = D.`department_id`

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT D.`name` as `corso`, C.`name`, T.`name`
FROM `degrees` D

JOIN `courses` as C
ON D.`id` = C.`degree_id`

JOIN `course_teacher` CT
ON C.`id`= CT.`course_id`

JOIN `teachers` T
ON T.`id`= CT.`teacher_id`

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT T.`name`,T.`surname`
FROM `teachers` T
JOIN `course_teacher` CT
ON T.`id`= CT.`teacher_id`
JOIN `courses` as C
ON C.`id` = CT.`course_id`
JOIN `degrees` D
ON D.`id` = C.`degree_id`
JOIN `departments` DD
ON DD.`id` = D.`department_id`
WHERE DD.`name`='Dipartimento di Matematica'

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
SELECT E.`id` as `N esame`,E.`date`,COUNT(*) as `Tentativi`,S.`name`,S.`surname`,ES.`vote` 
FROM `students` S 
JOIN `exam_student` ES 
ON S.`id` = ES.`student_id` 
JOIN `exams` E 
ON E.`id` = ES.`exam_id` 
WHERE ES.`vote`<18 
AND S.`id`=3 
GROUP BY ES.`exam_id`




SELECT COUNT(*)
FROM `students` S
JOIN `exam_student` ES
ON S.`id` = ES.`student_id`

WHERE ES.`vote`<18
AND S.`id`=3




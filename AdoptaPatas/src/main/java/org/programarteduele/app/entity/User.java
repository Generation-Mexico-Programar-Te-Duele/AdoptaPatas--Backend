package org.programarteduele.app.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.*;
import lombok.*;

/*
 *  @Entity se usa para marcar una clase como una entidad
 *  que se puede persistir en una base de datos relacional.
 *  Se indica a JPA que la clase representa una tabla
 *  en la base de datos y que los objetos de esta clase
 *  puedan ser almacenados, actualizados o eliminados en 
 *  dicha tabla. Además, cada instancia de la clase se considera
 *  una fila en la tabla.
 */

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Entity
@Table(name="user")
public class User {
	@Id //Indica que el atributo será la clave primaria de la entidad
	@GeneratedValue(strategy=GenerationType.IDENTITY) //Indica como se generan automaticamente las llaves primarias.
	private Long id;
	@Column(name="first_name", nullable=false, length=65)
	private String firstName; //Los tipo String son como VARCHAR en MySQL
	@Column(name="last_name", nullable=false, length=65)
	private String lastName;
	@Column(name="username", nullable=false, length=50, unique=true)
	private String username;
	@Column(name="age", nullable=false)
	private int age;
	@Column(name="email", nullable=false, length=100, unique=true)
	private String email;
	@Column(name="phone", nullable=false, length=16)
	private String phone;
	@Column(name="password_hash", nullable=false, length=45)
	private String password;
	@Column(name="city", nullable=false, length=45)
	private String city;
	@Column(name="state", nullable=false, length=45)
	private String state;
	@Column(name="profile_picture", length=255)
	private String porfilePicture;
	@Column(name="bio")
	private String bio;
	@ManyToOne
	@JoinColumn(name="user_type_id", nullable=false)
	//@JsonIgnoreProperties("role")
	private UserType userType;
	
	
}

/*
GenerationType.AUTO: Esta estrategia le permite al proveedor de JPA 
elegir automáticamente la estrategia de generación más adecuada según 
la base de datos y la configuración. El comportamiento exacto puede 
variar dependiendo del proveedor utilizado.

GenerationType.IDENTITY: Esta estrategia utiliza una columna de identidad 
de la base de datos para generar automáticamente los valores de la clave primaria. 
Es compatible con bases de datos como MySQL que admiten columnas de autoincremento. 
En este caso, la base de datos se encarga de generar y asignar el valor de la clave primaria.

GenerationType.SEQUENCE: Esta estrategia utiliza una secuencia de la base 
de datos para generar automáticamente los valores de la clave primaria. 
Se requiere que la base de datos admita secuencias. El proveedor de JPA 
utiliza la secuencia definida en la base de datos para obtener los valores 
de la clave primaria.

GenerationType.TABLE: Esta estrategia utiliza una tabla especial en la base 
de datos para generar los valores de la clave primaria. Se crea una tabla 
separada que registra los valores generados para cada entidad. El proveedor 
de JPA consulta esta tabla para obtener el próximo valor de la clave primaria.

*/

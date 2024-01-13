package org.programarteduele.app.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;

import jakarta.persistence.*;
import lombok.*;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Entity
@Table(name="user")
public class User {

	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column(name="first_name", nullable=false, length=65)
	private String firstName;
	@Column(name="last_name", nullable=false, length=65)
	private String lastName;
	@Column(name="username", nullable=false, length=50, unique=true)
	private String username;
	@Column(name="email", nullable=false, length=60, unique=true)
	private String email;
	@Column(name="phone", nullable=false, length=16)
	private String phone_number;
	@Column(name="password_hash", nullable=false, length=45)
	private String password;
	@Column(name="registered_at",columnDefinition="DATETIME DEFAULT CURRENT_TIMESTAMP", nullable=false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date registrationTime;
	@Column(name="updated_at",columnDefinition="DATETIME DEFAULT CURRENT_TIMESTAMP")
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedTime;
	@Column(name="street_name", nullable=false, length=40)
	private String street;
	@Column(name="city", nullable=false, length=30)
	private String city;
	@Column(name="state", nullable=false, length=45)
	private String state;
	@Column(name="zip_code", nullable=false, length=45)
	private String zipCode;
	@Column(name="profile_picture", length=255)
	private String profilePicture;
	@Column(name="bio")
	private String bioDescription;
	@Column(name="role", nullable=false, length=25)
	private String userRole;
	@Column(name="user_type", nullable=false, length=45)
	private String userType;
	@Column(name="date_of_birth",columnDefinition="DATETIME DEFAULT CURRENT_TIMESTAMP", nullable=false)
	@Temporal(TemporalType.TIMESTAMP)
	private Timestamp birthDate;
	
	// Creación de la tabla follower a partir de @JoinTable con @JoinColumn para atribuir
	// nombres a las columnas 
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(joinColumns = { @JoinColumn(name = "following_id") }, inverseJoinColumns = {
			@JoinColumn(name = "followers_id") })
	private Set<User> following;

	@ManyToMany(mappedBy = "following", fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	private Set<User> followers;
	
	// Un usuario puede publicar muchas mascotas
	// Relacion Bidireccional con "pet"
	@OneToMany(mappedBy = "user")
	private Set<Pet> pets;
	
	// Un usuario puede realizar varias solicitudes de adopción
	// Relacion Bidireccional con "adoption_inqiry"
	@OneToMany(mappedBy = "user")
	private Set<AdoptionInquiry> adoptionInquiries;
	
	// Un usuario puede tener muchas publicaciones
	// Relacion Bidireccional con "post"
	@OneToMany(mappedBy="user")
    private Set<Post> posts;
	
	
	
	
}

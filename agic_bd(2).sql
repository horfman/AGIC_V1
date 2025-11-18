-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 18 nov. 2025 à 05:28
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `agic_bd`
--

-- --------------------------------------------------------

--
-- Structure de la table `avaliser`
--

DROP TABLE IF EXISTS `avaliser`;
CREATE TABLE IF NOT EXISTS `avaliser` (
  `id_emprunt` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id_emprunt`,`user_id`),
  KEY `FK8oe3yaidecpsrh1lavvgqsf7m` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

DROP TABLE IF EXISTS `compte`;
CREATE TABLE IF NOT EXISTS `compte` (
  `type` varchar(4) NOT NULL,
  `id_compte` bigint NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `solde` double NOT NULL,
  `statut_compte` int DEFAULT NULL,
  `montant_collation` double DEFAULT NULL,
  `taux_interet` double DEFAULT NULL,
  `solde_max` double DEFAULT NULL,
  `desription` varchar(255) DEFAULT NULL,
  `montant_min` double DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_compte`),
  KEY `FKluwo6rhkeaqyvt47m25vg8iw2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `constat`
--

DROP TABLE IF EXISTS `constat`;
CREATE TABLE IF NOT EXISTS `constat` (
  `id_constat` bigint NOT NULL AUTO_INCREMENT,
  `paye` bit(1) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `id_sanction` bigint NOT NULL,
  `id_seance` bigint NOT NULL,
  PRIMARY KEY (`id_constat`),
  KEY `FKn6479t3ikowg708l97yg6lamv` (`user_id`),
  KEY `FKo39cs5611yarfpf6vakw0jrd4` (`id_sanction`),
  KEY `FK86r3n68yd7lw3cdcgokpvpqdg` (`id_seance`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `contribution`
--

DROP TABLE IF EXISTS `contribution`;
CREATE TABLE IF NOT EXISTS `contribution` (
  `idcontribution` bigint NOT NULL AUTO_INCREMENT,
  `montant_contribution` float NOT NULL,
  `user_id` bigint NOT NULL,
  `id_seance` bigint NOT NULL,
  `id_tontine` bigint NOT NULL,
  `id_contribution` bigint NOT NULL,
  PRIMARY KEY (`idcontribution`),
  KEY `FKk3n4qqj4p6facqlk7l1pc8hse` (`user_id`),
  KEY `FKek58dvbcvjhx5kewonmb7n8i` (`id_seance`),
  KEY `FKmmr1255rlj01jo47km1yc2u2d` (`id_tontine`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `demission`
--

DROP TABLE IF EXISTS `demission`;
CREATE TABLE IF NOT EXISTS `demission` (
  `id_demission` bigint NOT NULL AUTO_INCREMENT,
  `date_demission` date NOT NULL,
  `lettre_demission` varchar(50) NOT NULL,
  `id_demissionnaire` bigint NOT NULL,
  PRIMARY KEY (`id_demission`),
  KEY `FKoxc571ihdg4djt1w84gpwmq1v` (`id_demissionnaire`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `elire`
--

DROP TABLE IF EXISTS `elire`;
CREATE TABLE IF NOT EXISTS `elire` (
  `id_elire` bigint NOT NULL AUTO_INCREMENT,
  `date_adhesion` date DEFAULT NULL,
  `montant_inscription` int DEFAULT NULL,
  `id_exercice` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `id_responsabilite` bigint NOT NULL,
  PRIMARY KEY (`id_elire`),
  KEY `FKdqhn0qea5n8qcxdr7p7tcif44` (`id_exercice`),
  KEY `FK5hen5wds6ysk60ij624d2d0uc` (`user_id`),
  KEY `FKcc4xiy14356bitctss7lxeqqy` (`id_responsabilite`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `elire`
--

INSERT INTO `elire` (`id_elire`, `date_adhesion`, `montant_inscription`, `id_exercice`, `user_id`, `id_responsabilite`) VALUES
(19, '2022-09-03', 500, 1, 1, 11);

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

DROP TABLE IF EXISTS `emprunt`;
CREATE TABLE IF NOT EXISTS `emprunt` (
  `id_emprunt` bigint NOT NULL AUTO_INCREMENT,
  `date_emprunt` date NOT NULL,
  `date_limite` date NOT NULL,
  `etat` bit(1) NOT NULL,
  `montant` float NOT NULL,
  `reste_a_payer` double NOT NULL,
  `taux_interet` double NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id_emprunt`),
  KEY `FKhkbedlt2yc1r99hekmpgkjxsf` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `exercice`
--

DROP TABLE IF EXISTS `exercice`;
CREATE TABLE IF NOT EXISTS `exercice` (
  `id_exercice` bigint NOT NULL AUTO_INCREMENT,
  `date_debut_exercice` date NOT NULL,
  `date_fin_exercice` date NOT NULL,
  PRIMARY KEY (`id_exercice`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `exercice`
--

INSERT INTO `exercice` (`id_exercice`, `date_debut_exercice`, `date_fin_exercice`) VALUES
(1, '2022-09-03', '2023-09-02');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inscrire`
--

DROP TABLE IF EXISTS `inscrire`;
CREATE TABLE IF NOT EXISTS `inscrire` (
  `idinscription` bigint NOT NULL AUTO_INCREMENT,
  `mois_gain` varchar(10) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `id_tontine` bigint DEFAULT NULL,
  `id_inscription` bigint NOT NULL,
  PRIMARY KEY (`idinscription`),
  KEY `FK9ipvop9w8bfdkrb0ye3d8yx6d` (`user_id`),
  KEY `FK5ul5q7gvflikt1u7fk7x2yutt` (`id_tontine`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `operation`
--

DROP TABLE IF EXISTS `operation`;
CREATE TABLE IF NOT EXISTS `operation` (
  `id_operation` varchar(255) NOT NULL,
  `date_operation` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `montant` double NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `compte_id_compte` bigint DEFAULT NULL,
  `seance_id_seance` bigint DEFAULT NULL,
  PRIMARY KEY (`id_operation`),
  KEY `FKj7j5qsili7l8s0kxaogueykit` (`compte_id_compte`),
  KEY `FK1j540wn88kx6bfj91psv2g5o8` (`seance_id_seance`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `presents`
--

DROP TABLE IF EXISTS `presents`;
CREATE TABLE IF NOT EXISTS `presents` (
  `id_seance` bigint NOT NULL,
  `id_membre` bigint NOT NULL,
  PRIMARY KEY (`id_seance`,`id_membre`),
  KEY `FK8fjo8t9q6s2fl1q5cpx5h4481` (`id_membre`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `responsabilite`
--

DROP TABLE IF EXISTS `responsabilite`;
CREATE TABLE IF NOT EXISTS `responsabilite` (
  `id_responsabilite` bigint NOT NULL AUTO_INCREMENT,
  `duree_mandat` int DEFAULT NULL,
  `intitule_responsabilite` varchar(255) NOT NULL,
  PRIMARY KEY (`id_responsabilite`),
  UNIQUE KEY `UK_ffspd8lbksf0rgr9fdjw5hkvd` (`intitule_responsabilite`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `responsabilite`
--

INSERT INTO `responsabilite` (`id_responsabilite`, `duree_mandat`, `intitule_responsabilite`) VALUES
(1, 2, 'PRESIDENT'),
(2, 2, 'CENSEUR'),
(3, 2, 'SECRETAIRE'),
(4, 2, 'VICE_PRESIDENT'),
(5, 2, 'SECRETAIRE_ADJOINT'),
(6, 2, 'COMMISSAIRE_AU_COMPTE_1'),
(7, 2, 'COMMISSAIRE_AU_COMPTE_2'),
(10, 2, 'TRESORIER'),
(11, 2, 'MEMBRE');

-- --------------------------------------------------------

--
-- Structure de la table `sanction`
--

DROP TABLE IF EXISTS `sanction`;
CREATE TABLE IF NOT EXISTS `sanction` (
  `id_sanction` bigint NOT NULL AUTO_INCREMENT,
  `amende` int DEFAULT NULL,
  `libelle_sanction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_sanction`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `id_seance` bigint NOT NULL AUTO_INCREMENT,
  `compte_rendu` varchar(2000) DEFAULT NULL,
  `date_seance` date NOT NULL,
  `ordre_du_jour` varchar(255) NOT NULL,
  `type_seance` varchar(50) DEFAULT NULL,
  `id_exercice` bigint NOT NULL,
  `id_president` bigint NOT NULL,
  PRIMARY KEY (`id_seance`),
  KEY `FK3f9nobg5h5k2d4n6xko37gw08` (`id_exercice`),
  KEY `FKajkc0rk0821ube4bx234g3p4g` (`id_president`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_id_membre_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Ue2MpLqEyTMOeqKlQWRAtpzHvmG1oNPtu7Szq0bq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVlUdExid0NpOEJ0eFoxOWZuNDBlZDF4RnQ1R2tsbDl4N25sQ3dYcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763443500);

-- --------------------------------------------------------

--
-- Structure de la table `tontine`
--

DROP TABLE IF EXISTS `tontine`;
CREATE TABLE IF NOT EXISTS `tontine` (
  `id_tontine` bigint NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `etat` bit(1) NOT NULL,
  `libelle_tontine` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tontine`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `date_first_inscription` date NOT NULL,
  `date_naissance` date NOT NULL,
  `demissionnaire` bit(1) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `prenom_membre` varchar(50) DEFAULT NULL,
  `sexe_membre` char(1) NOT NULL,
  `statutgeographique` varchar(50) NOT NULL,
  `nom_membre` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `date_first_inscription`, `date_naissance`, `demissionnaire`, `login`, `photo`, `prenom_membre`, `sexe_membre`, `statutgeographique`, `nom_membre`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '2022-04-14', '2020-04-01', b'0', 'pik7', NULL, 'SERGE ALBERT', 'M', 'RESIDENT', '', '', NULL, '', NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    if (project.name != "app") {
        project.afterEvaluate {
            if (project.hasProperty("android")) {
                val android = project.extensions.findByName("android") as? com.android.build.gradle.BaseExtension
                android?.let {
                    if (it.namespace == null) {
                        it.namespace = "com.aura.music.${project.name.replace(":", ".").replace("-", ".")}"
                    }
                }
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

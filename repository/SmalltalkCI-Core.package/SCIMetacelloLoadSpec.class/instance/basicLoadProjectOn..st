executing
basicLoadProjectOn: aSmalltalkCI
  | metacello |
  aSmalltalkCI class requireMetacello.
  self updateMetacelloIfRequested.
  metacello := (Smalltalk at: #'Metacello') new.
  metacello
    repository: self loadRepository;
    baseline: self baseline;
    configuration: self configuration;
    version: self version.
  metacello copy get.	"compensate for older versions of Metacello"
  
  self withExceptionHandlerDo: [
    aSmalltalkCI performMetacelloLoad: [ metacello load: self load ] ]
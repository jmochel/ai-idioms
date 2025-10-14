# Prompt: Generate PRD for CLI Application

## Hone Idea

```plaintext
Ask me one question at a time so we can develop a thorough, step-by-step spec for this idea. Each question should build on my previous answers, and our end goal is to have a detailed specification I can hand off to a developer. Let’s do this iteratively and dig into every relevant detail. Remember, only one question at a time.

## Design Principles, Assumptions and Defaults

- Use sub-commands when the tool has distinct verbs/actions
- Use options/flags when the tool has _modifiers of a single action
- Specify lowercase for all sub-commands and options/flags
- All sub-commands are specified with a standard abbreviation and full command (e.g. `gen` for `generate`) both forms used interchangeably
- All options/flags are specified with a standard abbreviation and full flag (e.g. `-in` for `--input`) both forms used interchangeably
- Always specify a `--help` option. Command executed without any oiptions results in top-level help 
- Always specify a `--version` option which displays the semantic version (i.e. 1.0.0)
- If the functionality requires persistent configuration then 
    - Specify a `config` sub-command that records the configuration and keeps that data in user global dotfile (i.e `~/.<appname>/config.json5`) 
    - Specify a `config validate` sub-command that validates the configuration
- Assume (unless otherwise stated) that 
    - Any incoming OR stored configuration files are in JSON5 format
    - Any incoming or stored configuration files are processed as is (i.e. no changes in casing to keys or values)
    - That configuration is always provided via command line arguments or persistent config dotfile (avoid environment variables)
    - The app exits with generic non-zero exit code 1 rather than specialized failure codes for each type of failure
    - App output is to System Err and System Out and suitable for use in a Unix style pipe
    - All messages are english only (no internationalization) 
- If CSV input or output files are required assume that they adhere to RFC 4180
- If JSON input or output files are required assume that they adhere to RFC 8259
- Do not assume any particular implementation language for the application
- Assume all files have UTF-8 encoding


Here’s the idea:

<IDEA>

## (Optional) Notes on model being manipulated by the tool

.. Some Notes..

```

## When finalized, generate spec

```plaintext
Now that we’ve wrapped up the brainstorming process, can you compile our findings into a comprehensive, developer-ready specification? Include all relevant requirements, architecture choices, data handling details, error handling strategies, and a testing plan so a developer can immediately begin implementation.
```

This will output a pretty solid and straightforward spec that can be handed off to the planning step. Save it as `PRD.md` in the repo.




## Example

```markdown
Ask me one question at a time so we can develop a thorough, step-by-step spec for this idea. Each question should build on my previous answers, and our end goal is to have a detailed specification I can hand off to a developer. Let’s do this iteratively and dig into every relevant detail. Remember, only one question at a time.

Here is the idea:

A name generator that generates names (per culture color, per gender) based on probabilities of phoneme clusters and probablities of phonemes within the cluster.

## Design Principles, Assumptions and Defaults

- Use sub-commands when the tool has distinct verbs/actions
- Use options/flags when the tool has _modifiers of a single action
- Specify lowercase for all sub-commands and options/flags
- All sub-commands are specified with a standard abbreviation and full command (e.g. `gen` for `generate`) 
- All options/flags are specified with a standard abbreviation and full flag (e.g. `-in` for `--input`) 
- Always specify a `--help` option 
- Always specify a `--version` option
- If the functionality requires persistent configuration then 
    - Specify a `config` sub-command that records the configuration and keeps that data in user global dotfile (i.e `~/.<appname>/config.json5`) 
    - Specify a `config validate` sub-command that validates the configuration
- Assume (unless otherwise stated) that 
    - Any incoming OR stored configuration files are in JSON5 format
    - Any incoming or stored configuration files are processed as is (i.e. no changes in casing to keys or values)
    - That configuration is always provided via command line arguments or persistent config dotfile (avoid environment variables)
    - The app exits with generic non-zero exit code 1 rather than specialized failure codes for each type of failure
    - App output is to System Err and System Out and suitable for use in a Unix style pipe
- If CSV input or output files are required assume that they adhere to RFC 4180
- If JSON input or output files are required assume that they adhere to RFC 8259
- Do not assume any particular implementation language for the application

## The model in JSON 

```json
{
   "schema-version" : 1,
   "cultures" : [

        "kothan": {

            "abbreviation" : "koth",

            "genders": [

                "male": {
                    "abbreviation" : "m",

                    "given-name": {                    
                        "hard-onsets": { "Th": 0.30, "Bj": 0.20, "Sk": 0.11, "R": 0.39 },
                        "soft-onsets": { "Th": 0.3, "Bj": 0.2, "Sk": 0.1, "R": 0.4 },
                        "hard-medials": { "ar": 0.5, "ol": 0.3, "in": 0.2 },
                        "soft-medials": { "ar": 0.5, "ol": 0.3, "in": 0.2 },
                        "hard-codas": { "n": 0.4, "r": 0.4, "f": 0.2 },
                        "soft-codas": { "n": 0.4, "r": 0.4, "f": 0.2 },
                        "clusters" : {
                            "Oc" : 0.1,
                            "OC" : 0.1,
                            "oc" : 0.1,
                            "oC" : 0.1,
                            "OMc" : 0.2,
                            "OmC" : 0.4
                        }
                    },

                    "surname": {                    
                        "hard-onsets": { "Th": 0.30, "Bj": 0.20, "Sk": 0.11, "R": 0.39 },
                        "soft-onsets": { "Th": 0.3, "Bj": 0.2, "Sk": 0.1, "R": 0.4 },
                        "hard-medials": { "ar": 0.5, "ol": 0.3, "in": 0.2 },
                        "soft-medials": { "ar": 0.5, "ol": 0.3, "in": 0.2 },
                        "hard-codas": { "n": 0.4, "r": 0.4, "f": 0.2 },
                        "soft-codas": { "n": 0.4, "r": 0.4, "f": 0.2 },
                        "clusters" : {
                            "Oc" : 0.1,
                            "OC" : 0.1,
                            "oc" : 0.1,
                            "oC" : 0.1,
                            "OMc" : 0.2,
                            "OmC" : 0.4
                        }
                    }
                },

                "female": {
                    "abbreviation" : "f",
                    "given-name": {                    
                        "hard-onsets": { "Th": 0.30, "Bj": 0.20, "Sk": 0.11, "R": 0.39 },
                        "soft-onsets": { "Th": 0.3, "Bj": 0.2, "Sk": 0.1, "R": 0.4 },
                        "hard-medials": { "ar": 0.5, "ol": 0.3, "in": 0.2 },
                        "soft-medials": { "ar": 0.5, "ol": 0.3, "in": 0.2 },
                        "hard-codas": { "n": 0.4, "r": 0.4, "f": 0.2 },
                        "soft-codas": { "n": 0.4, "r": 0.4, "f": 0.2 },
                        "clusters" : {
                            "Oc" : 0.1,
                            "OC" : 0.1,
                            "oc" : 0.1,
                            "oC" : 0.1,
                            "OMc" : 0.2,
                            "OmC" : 0.4
                        }
                    },

                    "surname": {                    
                        "hard-onsets": { "Th": 0.30, "Bj": 0.20, "Sk": 0.11, "R": 0.39 },
                        "soft-onsets": { "Th": 0.3, "Bj": 0.2, "Sk": 0.1, "R": 0.4 },
                        "hard-medials": { "ar": 0.5, "ol": 0.3, "in": 0.2 },
                        "soft-medials": { "ar": 0.5, "ol": 0.3, "in": 0.2 },
                        "hard-codas": { "n": 0.4, "r": 0.4, "f": 0.2 },
                        "soft-codas": { "n": 0.4, "r": 0.4, "f": 0.2 },
                        "clusters" : {
                            "Oc" : 0.1,
                            "OC" : 0.1,
                            "oc" : 0.1,
                            "oC" : 0.1,
                            "OMc" : 0.2,
                            "OmC" : 0.4
                        }
                    }
                },

                "eunuch": {
                    "abbreviation" : "en",
                    "given-name": {                    
                        "hard-onsets": { "Th": 0.30, "Bj": 0.20, "Sk": 0.11, "R": 0.39 },
                        "soft-onsets": { "Th": 0.3, "Bj": 0.2, "Sk": 0.1, "R": 0.4 },
                        "hard-medials": { "ar": 0.5, "ol": 0.3, "in": 0.2 },
                        "soft-medials": { "ar": 0.5, "ol": 0.3, "in": 0.2 },
                        "hard-codas": { "n": 0.4, "r": 0.4, "f": 0.2 },
                        "soft-codas": { "n": 0.4, "r": 0.4, "f": 0.2 },
                        "clusters" : {
                            "Oc" : 0.1,
                            "OC" : 0.1,
                            "oc" : 0.1,
                            "oC" : 0.1,
                            "OMc" : 0.2,
                            "OmC" : 0.4
                        }
                    },

                    "surname": {                    
                        "hard-onsets": { "Th": 0.30, "Bj": 0.20, "Sk": 0.11, "R": 0.39 },
                        "soft-onsets": { "Th": 0.3, "Bj": 0.2, "Sk": 0.1, "R": 0.4 },
                        "hard-medials": { "ar": 0.5, "ol": 0.3, "in": 0.2 },
                        "soft-medials": { "ar": 0.5, "ol": 0.3, "in": 0.2 },
                        "hard-codas": { "n": 0.4, "r": 0.4, "f": 0.2 },
                        "soft-codas": { "n": 0.4, "r": 0.4, "f": 0.2 },
                        "clusters" : {
                            "Oc" : 0.1,
                            "OC" : 0.1,
                            "oc" : 0.1,
                            "oC" : 0.1,
                            "OMc" : 0.2,
                            "OmC" : 0.4
                        }
                    }
                },

                "male-royal": {
                    "abbreviation" : "mr",
                    "given-name": {                    
                        "hard-onsets": { "Th": 0.30, "Bj": 0.20, "Sk": 0.11, "R": 0.39 },
                        "soft-onsets": { "Th": 0.3, "Bj": 0.2, "Sk": 0.1, "R": 0.4 },
                        "hard-medials": { "ar": 0.5, "ol": 0.3, "in": 0.2 },
                        "soft-medials": { "ar": 0.5, "ol": 0.3, "in": 0.2 },
                        "hard-codas": { "n": 0.4, "r": 0.4, "f": 0.2 },
                        "soft-codas": { "n": 0.4, "r": 0.4, "f": 0.2 },
                        "clusters" : {
                            "Oc" : 0.1,
                            "OC" : 0.1,
                            "oc" : 0.1,
                            "oC" : 0.1,
                            "OMc" : 0.2,
                            "OmC" : 0.4
                        }
                    },

                    "surname": {                    
                        "hard-onsets": { "Smith": 0.30, "Jone": 0.20, "Kowalski": 0.11, "Sanderson": 0.39 },
                        "soft-onsets": {  },
                        "hard-medials": { },
                        "soft-medials": {},
                        "hard-codas": { },
                        "soft-codas": { },
                        "clusters" : {
                            "O" : 1.00
                        }
                    }
                }
            ],
            "transliterations" : {
                "Tx" : "Ch",
                "Tz" : "J"
            }
        }
   ]
}
```

Where 

- Each culture 
    - Is identified by abbreviation
    - Has a full name 
    - Has one or more Genders
    - A list of transliterations mapping strings in generated names to their english equivalent

- Each Gender
    - Is identified by abbreviation
    - Has a full name 
    - Has configuration for generating given names 
    - Has configuration for generating surnames

The configuration for generating given names has 
    - A set of weighted hard onset (beginning of the name) graphemes. (weightings are in scale 0.00-1.00 and must add up to 1.00)
    - A set of weighted soft onset (beginning of the name) graphemes. (weightings are in scale 0.00-1.00 and must add up to 1.00)
    - A set of weighted hard medial (middle of the name) graphemes. (weightings are in scale 0.00-1.00 and must add up to 1.00)
    - A set of weighted soft medial (middle of the name) graphemes. (weightings are in scale 0.00-1.00 and must add up to 1.00)
    - A set of weighted hard coda (end of the name) graphemes. (weightings are in scale 0.00-1.00 and must add up to 1.00)
    - A set of weighted soft coda (end of the name) graphemes. (weightings are in scale 0.00-1.00 and must add up to 1.00)
    - A set of weighted phoneme clusters (weightings are in scale 0.00-1.00 and must add up to 1.00)
    - 
The configuration for generating surnames has 
    - A set of weighted hard onset (beginning of the name) graphemes. (weightings are in scale 0.00-1.00 and must add up to 1.00)
    - A set of weighted soft onset (beginning of the name) graphemes. (weightings are in scale 0.00-1.00 and must add up to 1.00)
    - A set of weighted hard medial (middle of the name) graphemes. (weightings are in scale 0.00-1.00 and must add up to 1.00)
    - A set of weighted soft medial (middle of the name) graphemes. (weightings are in scale 0.00-1.00 and must add up to 1.00)
    - A set of weighted hard coda (end of the name) graphemes. (weightings are in scale 0.00-1.00 and must add up to 1.00)
    - A set of weighted soft coda (end of the name) graphemes. (weightings are in scale 0.00-1.00 and must add up to 1.00)
    - A set of weighted phoneme clusters (weightings are in scale 0.00-1.00 and must add up to 1.00)

Each weighted phoneme cluster
  - Has a  Spec like "OMc" or "oMC[ ko]" or "oM[ ]MC" where 
    - 'O' indicates a hard onset grapheme 
    - 'o' indicates a soft onset grapheme 
    - 'M' indicates a hard medial grapheme 
    - 'm' indicates a soft medial grapheme 
    - 'C' indicates a hard coda grapheme 
    - 'c' indicates a soft coda grapheme 
    - Any text within square brackets "[]" are used as is (without the brackets themselves) 

Each grapheme is used as is with no character limit
```





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:currency_code:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

    countries = [
        {
            name: 'Rwanda',
            postal_code: 00000,
            country_code: 250,
            currency_name: 'Rwandan Francs',
            currency_symbol: 'RWF',
            exchange: 1/1080,
        },
        {
            name: 'Algeria',
            currency_name: 'Dinar',
            currency_symbol: 'DA',
            postal_code: 00000,
            country_code: 213,
            exchange: 1/120,
        },
        {
            name: 'Benin Republic',
            currency_name: 'CFA Franc',
            currency_symbol: 'CF',
            postal_code: 00000,
            country_code: 229,
            exchange: 1/500,
        },
        {
            name: 'Democratic Republic of the Congo',
            currency_name: 'Congolese Franc',
            currency_symbol: 'FC',
            postal_code: 00000,
            country_code: 243,
            exchange: 1/2100,
        },
        {
            name: 'Kenya',
            currency_name: 'Kenyan Shilling',
            currency_symbol: 'Ksh',
            postal_code: 00000,
            country_code: 243,
            exchange: 1/2100,
        },

    ]

    mostUsedCurrencies = [
        {
            symbole: '$',
            name: 'USD',
            exchange: 1000,
            country: 'United States'
        },
        {
            symbole: '€',
            name: 'EUR',
            exchange: 966,
            country: 'Europe',
        },
        {
            symbole: '¥',
            name: 'Japanese Yen(JPY)',
            exchange: 133430,
            country: 'Japan',
        },
        {
            symbole: '¥',
            name: 'Chinese Yuan(CNY)',
            exchange: 6900,
            country: 'China',
        },
        {
            symbole: '£',
            name: 'British Pound Sterling(GBP)',
            exchange: 845,
            country: 'United Kingdom',
        },
    ]

    # mostUsedCurrencies.each do |currency|
    #     Currency.create(currency)
    # end   
    
    stores_categories_list = [
        { name: "Chemical" },
        { name: "Pharmacie" },
        { name: "Electronic" },
        { name: "Mechanic" },
        { name: "Clothes" },
        { name: "Construction" },
        { name: "Food" },
        { name: "Restaurent" },
        { name: "Hotel" },
        { name: "Banks" },
        { name: "Telecom" },
        { name: "Others" },
    ]

    # stores_categories_list.each do |category|
    #     StoreCategoriesList.create(category)
    # end

    # stores_categories_list.each do |category|
    #     ItemCategoriesList.create(category)
    # end    
